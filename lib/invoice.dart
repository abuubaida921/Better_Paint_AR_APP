import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  final String customerName = "John Doe";
  final String customerAddress = "123 Main St, City, Country";
  final String customerContact = "john.doe@email.com";
  final String invoiceDate = "September 12, 2024";
  final List<Map<String, dynamic>> services = [
    {"description": "Wall Painting", "quantity": 2, "price": 120.0},
    {"description": "Ceiling Painting", "quantity": 1, "price": 80.0},
    {"description": "Trim Work", "quantity": 5, "price": 40.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_right.png',
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 20),
                  _buildCustomerInfo(),
                  SizedBox(height: 20),
                  _buildInvoiceItems(),
                  SizedBox(height: 20),
                  _buildTotalAmount(),
                  SizedBox(height: 20),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  // Header: Invoice title and date
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Invoice",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          invoiceDate,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Customer Info Section
  Widget _buildCustomerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bill To:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(customerName, style: TextStyle(fontSize: 16)),
        Text(customerAddress, style: TextStyle(fontSize: 16)),
        Text(customerContact, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  // Itemized List of Services
  Widget _buildInvoiceItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Table(
          columnWidths: {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Qty", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            for (var service in services)
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(service["description"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(service["quantity"].toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$${service["price"].toStringAsFixed(2)}"),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  // Total Amount Section
  Widget _buildTotalAmount() {
    double subtotal = services.fold(0, (sum, item) => sum + item["quantity"] * item["price"]);
    double tax = subtotal * 0.15; // 15% tax
    double total = subtotal + tax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Subtotal: \$${subtotal.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "Tax (15%): \$${tax.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
        Text(
          "Total: \$${total.toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Footer with a Pay Now Button
  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Thank you for your business!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement payment functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(primaryColor),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Pay Now",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InvoiceScreen(),
  ));
}
