import 'dart:convert';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
=======
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
>>>>>>> master_login_backend
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class CreateListingPage extends StatefulWidget {
  const CreateListingPage({super.key});

  @override
  _CreateListingPageState createState() => _CreateListingPageState();
}

class _CreateListingPageState extends State<CreateListingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _uploadedImageUrl;
  bool _isCreatingListing = false;
  bool _isViewingMyProducts = false;
  bool _isViewingAllOrders = false;
  int _pendingOrderCount = 0; // Track pending orders count
  int _completedOrderCount = 0; // Track completed orders count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Shop Status Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusTile("$_pendingOrderCount", "pending orders"),
                _buildStatusTile("$_completedOrderCount", "completed"),
                _buildStatusTile("1", "reviews"),
              ],
            ),
          ),
<<<<<<< HEAD
          if (_isCreatingListing)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration:
                      const InputDecoration(labelText: "Product Title"),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration:
                      const InputDecoration(labelText: "Add Description"),
                    ),
                    TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration:
                      const InputDecoration(labelText: "Price (PHP)"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: uploadImageToCloudinary,
                      icon: const Icon(Icons.image),
                      label: const Text("Upload Image"),
                    ),
                    if (_uploadedImageUrl != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Image.network(
                          _uploadedImageUrl!,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: createListing,
                      child: const Text("Publish Listing"),
                    ),
                  ],
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Your Listings:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
=======
          const SizedBox(height: 16),
          // Action Menu Section
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text("All orders"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              setState(() {
                _isViewingAllOrders = true;
                _isCreatingListing = false;
                _isViewingMyProducts = false;
              });
            },
>>>>>>> master_login_backend
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("My products"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              setState(() {
                _isViewingMyProducts = true;
                _isCreatingListing = false;
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Create a listing"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              setState(() {
                _isCreatingListing = true;
                _isViewingMyProducts = false;
              });
            },
          ),
          const Divider(),
          // Listings or Form Section
          Expanded(
<<<<<<< HEAD
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('post')
                  .where('postUserId',
                  isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final listings = snapshot.data!.docs;
                if (listings.isEmpty) {
                  return const Center(child: Text("No listings found."));
                }
                return ListView.builder(
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    final listing = listings[index];
                    final data = listing.data() as Map<String, dynamic>;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: data['image_url'] != null
                            ? Image.network(
                          data['image_url'],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                            : const Icon(Icons.image_not_supported),
                        title: Text(data['postTitle'] ?? "No Title"),
                        subtitle: Text("PHP ${data['price'] ?? '0.0'}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteListing(listing.id),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
=======
            child: _isCreatingListing
                ? _buildCreateListingForm()
                : _isViewingMyProducts
                    ? _buildMyProductsList()
                    : _isViewingAllOrders
                        ? _buildOrdersList()
                        : const Center(
                            child: Text("Select an option to proceed.")),
>>>>>>> master_login_backend
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
=======
  Widget _buildStatusTile(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildCreateListingForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Product Title"),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: "Add Description"),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Price (PHP)"),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: uploadImageToCloudinary,
            icon: const Icon(Icons.image),
            label: const Text("Upload Image"),
          ),
          if (_uploadedImageUrl != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.network(
                _uploadedImageUrl!,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: createListing,
            child: const Text("Publish Listing"),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        if (orders.isEmpty) {
          return const Center(child: Text("No orders found."));
        }

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final data = order.data() as Map<String, dynamic>;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(data['user_name'] ?? 'Unknown User'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: ${data['user_email'] ?? 'N/A'}"),
                    Text("Total Price: PHP ${data['total_price']}"),
                    const SizedBox(height: 8),
                    Text("Products:"),
                    for (var product in data['products'])
                      Text(
                        "- ${product['title']} (x${product['quantity']}): PHP ${product['price']}",
                      ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.check_circle, color: Colors.blue),
                  onPressed: () => markOrderAsCompleted(order.id),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> markOrderAsCompleted(String orderId) async {
    try {
      final orderDoc = await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .get();
      final orderData = orderDoc.data() as Map<String, dynamic>;

      if (orderData['status'] == 'completed') {
        return;
      }

      // Update the order status to 'completed'
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .update({
        'status': 'completed',
        'completed_at': DateTime.now(),
      });

      // Add the order to 'completed_orders'
      await FirebaseFirestore.instance
          .collection('completed_orders')
          .doc(orderId)
          .set(orderData);

      // Remove the order from 'orders' collection (moving it)
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .delete();

      // Update the order counts
      setState(() {
        _completedOrderCount++; // Increase completed orders
      });

      // Show a message that the order was completed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order marked as completed")),
      );
    } catch (e) {
      print("Error marking order as completed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to mark order as completed")),
      );
    }
  }

// To update the pending orders when a new order is placed, use a similar approach:
  Future<void> createNewOrder(Map<String, dynamic> orderData) async {
    try {
      // Add the order to the 'orders' collection
      await FirebaseFirestore.instance.collection('orders').add(orderData);

      // Increment the pending order count
      await FirebaseFirestore.instance
          .collection('shop_status')
          .doc('status')
          .update({
        'pending_orders': FieldValue.increment(1), // Increment by 1
      });

      setState(() {
        _pendingOrderCount++; // Update local count as well
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New order placed!")),
      );
    } catch (e) {
      print("Error creating new order: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to create new order")),
      );
    }
  }

>>>>>>> master_login_backend
  Future<void> uploadImageToCloudinary() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        if (kDebugMode) {
          print("No image selected.");
        }
        return;
      }

      File file = File(pickedFile.path);

      if (!file.existsSync()) {
        if (kDebugMode) {
          print("File does not exist: ${pickedFile.path}");
        }
        return;
      }

      String fileExtension = pickedFile.path.split('.').last.toLowerCase();
      switch (fileExtension) {
        case 'jpg':
        case 'jpeg':
          break;
        case 'png':
          break;
        default:
          break;
      }

      const String cloudName = 'drlvci7kt';
      const String uploadPreset = 'cndztdyy';

<<<<<<< HEAD
      final url = Uri.parse(
          'https://api.cloudinary.com/v1_1/$cloudName/image/upload');
=======
      final url =
          Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
>>>>>>> master_login_backend

      var request = http.MultipartRequest('POST', url);

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: MediaType('image', fileExtension),
        ),
      );

      request.fields['upload_preset'] = uploadPreset;

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);
        String imageUrl = jsonResponse['secure_url'];

        if (kDebugMode) {
          print("Upload complete. Image URL: $imageUrl");
        }

        setState(() {
          _uploadedImageUrl = imageUrl;
        });
      } else {
        if (kDebugMode) {
          print("Upload failed with status: ${response.statusCode}");
        }
        throw Exception("Upload to Cloudinary failed");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error during upload: $e");
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
      );
    }
  }

  Future<void> createListing() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        print("No user is logged in.");
        return;
      }

      String userId = currentUser.uid;

      String userDisplayName = currentUser.displayName ?? 'Unknown Seller';

      if (_titleController.text.isEmpty ||
          _descriptionController.text.isEmpty ||
          _priceController.text.isEmpty ||
          _uploadedImageUrl == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill all fields and upload an image"),
          ),
        );
        return;
      }

      final listingData = {
        'post_title': _titleController.text,
        'post_description': _descriptionController.text,
        'price': double.parse(_priceController.text),
        'image_url': _uploadedImageUrl,
        'post_users': userId,
        'num_comments': 0,
        'createdAt': FieldValue.serverTimestamp(),
        'sellerName': userDisplayName,
      };

      await FirebaseFirestore.instance.collection('post').add(listingData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Listing created successfully!")),
      );

      setState(() {
        _titleController.clear();
        _descriptionController.clear();
        _priceController.clear();
        _uploadedImageUrl = null;
        _isCreatingListing = false;
      });
    } catch (e) {
      print("Error creating listing: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error creating listing: ${e.toString()}")),
      );
    }
  }

  Widget _buildMyProductsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('listings')
          .where('created_by',
              isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final listings = snapshot.data!.docs;

        if (listings.isEmpty) {
          return const Center(child: Text("You have no products listed."));
        }

        return ListView.builder(
          itemCount: listings.length,
          itemBuilder: (context, index) {
            final listing = listings[index];
            final data = listing.data() as Map<String, dynamic>;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(data['title']),
                subtitle: Text("PHP ${data['price']}"),
                leading: Image.network(
                  data['image_url'] ?? '',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteListing(listing.id),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> deleteListing(String listingId) async {
    try {
      // Delete listing from Firestore
      await FirebaseFirestore.instance
          .collection('listings')
          .doc(listingId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Listing deleted successfully")),
      );
    } catch (e) {
      print("Error deleting listing: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to delete listing")),
      );
    }
  }
}