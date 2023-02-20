import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int? id;
  final int? customerId;
  final List<int> ProductIds;
  final double? subtotal;
  final double? total;
  final bool isAccepted;
  final bool isDeliverd;
  final double? DeliveryFee;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.DeliveryFee,
    required this.customerId,
    required this.ProductIds,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDeliverd,
    required this.createdAt,
  });
  Order copyWith({
    final int? id,
    final double? DeliveryFee,
    final int? customerId,
    final List<int>? ProductIds,
    final double? subtotal,
    final double? total,
    final bool? isAccepted,
    final bool? isDeliverd,
    final DateTime? createdAt,
  }) {
    return Order(
        id: id ?? this.id,
        DeliveryFee: DeliveryFee ?? this.DeliveryFee,
        customerId: customerId ?? this.customerId,
        ProductIds: ProductIds ?? this.ProductIds,
        subtotal: subtotal ?? this.subtotal,
        total: total ?? this.total,
        isAccepted: isAccepted ?? this.isAccepted,
        isDeliverd: isDeliverd ?? this.isDeliverd,
        createdAt: createdAt ?? this.createdAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      '  ProductIds': ProductIds,
      'subtotal': subtotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDeliverd': isDeliverd,
      'DeliveryFee': DeliveryFee,
      'createdAt': createdAt.microsecondsSinceEpoch
    };
  }

//factory Order.fromSnapShot(DocumentSnapShot snap){}
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  static List<Order> orders = [
    Order(
      id: 1,
      ProductIds: const [1, 2],
      createdAt: DateTime.now(),
      customerId: 2345,
      isAccepted: false,
      isDeliverd: false,
      subtotal: 20,
      total: 30,
      DeliveryFee: 30.0,
    ),
    Order(
        id: 2,
        ProductIds: const [1, 2],
        createdAt: DateTime.now(),
        customerId: 4536,
        isAccepted: false,
        isDeliverd: false,
        subtotal: 30,
        total: 30,
        DeliveryFee: 30.0),
  ];
}
