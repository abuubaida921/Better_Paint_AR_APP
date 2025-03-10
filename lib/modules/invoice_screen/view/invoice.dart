import 'dart:ffi';

import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';

import '../../quote_generate_email/controller/quote_generate_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceScreen extends GetView<QuoteGenerateController> {
   const InvoiceScreen({super.key});

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
                  const SizedBox(height: 20),
                  _buildCustomerInfo(),
                  const SizedBox(height: 20),
                  _buildInvoiceItems(),
                  const SizedBox(height: 20),
                  _buildTotalAmount(),
                  const SizedBox(height: 20),
                  _buildFooter(context),
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
        const Text(
          "Invoice",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
        DateFormat('MMMM d, y').format(DateTime.now()),
          style: const TextStyle(
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
        const Text(
          "Bill To:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text('${controller.quoteInvoiceResponseModel.details!.customer!.name}', style: const TextStyle(fontSize: 16)),
        Text('${controller.quoteInvoiceResponseModel.details!.customer!.address}', style: const TextStyle(fontSize: 16)),
        Text('${controller.quoteInvoiceResponseModel.details!.customer!.email}', style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  // Itemized List of Services
  Widget _buildInvoiceItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Services",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
          },
          children: [
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Qty", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            for (var service in controller.quoteInvoiceResponseModel.details!.rooms!)
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(service.quoteRoomName??''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${service.specificationOfAreas!.length+service.addOns!.length}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$${service.totalPrice.toString()}"),
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
    double subtotal = controller.quoteInvoiceResponseModel.details!.rooms!.fold(0, (sum, item) => sum + double.parse(item.totalPrice??'0'));
    double tax = subtotal * 0.15; // 15% tax
    double total = subtotal + tax;
    controller.finalAmountToPay.value=total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Subtotal: \$${subtotal.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          "Tax (15%): \$${tax.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16),
        ),
        const Divider(),
        Text(
          "Total: \$${controller.finalAmountToPay.value.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Footer with a Pay Now Button
  Widget _buildFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Thank you for your business!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            controller.makePayment(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(primaryColor),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
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
