// Requires
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

// Trigger on new order created
exports.sendNotification = functions.firestore
    .document('orders/{store_id}')
    .onCreate(async (snapshot, context) => {

        // Get order data
        const order = snapshot.data();

        // Get user fcm token
        const userRef = admin.firestore().collection('user_accounts')
            .where('user_id', '==', order.store_id);
        const userSnapshot = await userRef.get();

        if (!userSnapshot.empty) {
            const user = userSnapshot.docs[0].data();
            const fcmToken = user.device_token;

            // Create notification payload
            const payload = {
                notification: {
                    title: 'New Order Created',
                    body: `Your order ${order.id} has been received!`
                }
            };

            // Send notification
            return admin.messaging().sendToDevice(fcmToken, payload);
        }

    });