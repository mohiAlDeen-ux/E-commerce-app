// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get Language_name {
    return Intl.message(
      'English',
      name: 'Language_name',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover_page_label {
    return Intl.message(
      'Discover',
      name: 'discover_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark_page_label {
    return Intl.message(
      'Bookmark',
      name: 'bookmark_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_page_label {
    return Intl.message(
      'Profile',
      name: 'profile_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart_page_label {
    return Intl.message(
      'Cart',
      name: 'cart_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get home_page_label {
    return Intl.message(
      'Shop',
      name: 'home_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Get Help`
  String get get_help {
    return Intl.message(
      'Get Help',
      name: 'get_help',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Returns`
  String get returns {
    return Intl.message(
      'Returns',
      name: 'returns',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message(
      'Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Personalization`
  String get personalization {
    return Intl.message(
      'Personalization',
      name: 'personalization',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help_and_support {
    return Intl.message(
      'Help & Support',
      name: 'help_and_support',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get category {
    return Intl.message(
      'Categories',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Edit Photo`
  String get edit_photo {
    return Intl.message(
      'Edit Photo',
      name: 'edit_photo',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get bay_now {
    return Intl.message(
      'Buy Now',
      name: 'bay_now',
      desc: '',
      args: [],
    );
  }

  /// `Unit price`
  String get unit_price {
    return Intl.message(
      'Unit price',
      name: 'unit_price',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total_price {
    return Intl.message(
      'Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Available in stock`
  String get available_in_stock {
    return Intl.message(
      'Available in stock',
      name: 'available_in_stock',
      desc: '',
      args: [],
    );
  }

  /// `Currently unavailable`
  String get currently_unavailable {
    return Intl.message(
      'Currently unavailable',
      name: 'currently_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `You may also like`
  String get you_may_also_like {
    return Intl.message(
      'You may also like',
      name: 'you_may_also_like',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get product_details {
    return Intl.message(
      'Product Details',
      name: 'product_details',
      desc: '',
      args: [],
    );
  }

  /// `Product info`
  String get product_info {
    return Intl.message(
      'Product info',
      name: 'product_info',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Information`
  String get shipping_information {
    return Intl.message(
      'Shipping Information',
      name: 'shipping_information',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Size guide`
  String get size_guide {
    return Intl.message(
      'Size guide',
      name: 'size_guide',
      desc: '',
      args: [],
    );
  }

  /// `Check stores`
  String get check_stores {
    return Intl.message(
      'Check stores',
      name: 'check_stores',
      desc: '',
      args: [],
    );
  }

  /// `Store pickup availability`
  String get store_pickup_availability {
    return Intl.message(
      'Store pickup availability',
      name: 'store_pickup_availability',
      desc: '',
      args: [],
    );
  }

  /// `Select a size to check store availability and In-Store pickup options.`
  String get select_a_size_to_check_store_doc {
    return Intl.message(
      'Select a size to check store availability and In-Store pickup options.',
      name: 'select_a_size_to_check_store_doc',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get check_out {
    return Intl.message(
      'Checkout',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `Continue shopping`
  String get continue_shopping {
    return Intl.message(
      'Continue shopping',
      name: 'continue_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Click the checkout button to complete the purchase process.`
  String get click_the_checkout_button_to_complete_the_purchase_process {
    return Intl.message(
      'Click the checkout button to complete the purchase process.',
      name: 'click_the_checkout_button_to_complete_the_purchase_process',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart`
  String get added_to_cart {
    return Intl.message(
      'Added to cart',
      name: 'added_to_cart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
