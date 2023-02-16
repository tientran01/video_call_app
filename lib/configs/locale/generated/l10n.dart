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

  /// `Channel name`
  String get channel_name {
    return Intl.message(
      'Channel name',
      name: 'channel_name',
      desc: '',
      args: [],
    );
  }

  /// `Join meeting`
  String get join_meeting {
    return Intl.message(
      'Join meeting',
      name: 'join_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Get started with your account`
  String get get_started {
    return Intl.message(
      'Get started with your account',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Meeting ID`
  String get meeting_id {
    return Intl.message(
      'Meeting ID',
      name: 'meeting_id',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enter_your_email_address {
    return Intl.message(
      'Enter your email address',
      name: 'enter_your_email_address',
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

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Meetings`
  String get meetings {
    return Intl.message(
      'Meetings',
      name: 'meetings',
      desc: '',
      args: [],
    );
  }

  /// `New meeting`
  String get new_meeting {
    return Intl.message(
      'New meeting',
      name: 'new_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Share Screen`
  String get share_screen {
    return Intl.message(
      'Share Screen',
      name: 'share_screen',
      desc: '',
      args: [],
    );
  }

  /// `Add a calendar`
  String get add_a_calendar {
    return Intl.message(
      'Add a calendar',
      name: 'add_a_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Team Chat`
  String get team_chat {
    return Intl.message(
      'Team Chat',
      name: 'team_chat',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Find people and start chatting!`
  String get find_people {
    return Intl.message(
      'Find people and start chatting!',
      name: 'find_people',
      desc: '',
      args: [],
    );
  }

  /// `Add Contacts`
  String get add_contacts {
    return Intl.message(
      'Add Contacts',
      name: 'add_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Channels`
  String get channels {
    return Intl.message(
      'Channels',
      name: 'channels',
      desc: '',
      args: [],
    );
  }

  /// `Personal Meeting ID`
  String get personal_metting_id {
    return Intl.message(
      'Personal Meeting ID',
      name: 'personal_metting_id',
      desc: '',
      args: [],
    );
  }

  /// `Start a Meeting`
  String get start_meeting {
    return Intl.message(
      'Start a Meeting',
      name: 'start_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Send Invitation`
  String get send_invitaion {
    return Intl.message(
      'Send Invitation',
      name: 'send_invitaion',
      desc: '',
      args: [],
    );
  }

  /// `Edit Meeting`
  String get edit_meeting {
    return Intl.message(
      'Edit Meeting',
      name: 'edit_meeting',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Join Audio`
  String get join_audio {
    return Intl.message(
      'Join Audio',
      name: 'join_audio',
      desc: '',
      args: [],
    );
  }

  /// `Stop Video`
  String get stop_video {
    return Intl.message(
      'Stop Video',
      name: 'stop_video',
      desc: '',
      args: [],
    );
  }

  /// `Participants`
  String get participant {
    return Intl.message(
      'Participants',
      name: 'participant',
      desc: '',
      args: [],
    );
  }

  /// `My Contacts`
  String get my_contacts {
    return Intl.message(
      'My Contacts',
      name: 'my_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Starred`
  String get starred {
    return Intl.message(
      'Starred',
      name: 'starred',
      desc: '',
      args: [],
    );
  }

  /// `External Contacts`
  String get external_contacts {
    return Intl.message(
      'External Contacts',
      name: 'external_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Search contacts`
  String get search_contacts {
    return Intl.message(
      'Search contacts',
      name: 'search_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Connect Phone Contacts`
  String get connect_phone_contacts {
    return Intl.message(
      'Connect Phone Contacts',
      name: 'connect_phone_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Join a Channel`
  String get join_a_channel {
    return Intl.message(
      'Join a Channel',
      name: 'join_a_channel',
      desc: '',
      args: [],
    );
  }

  /// `Create a New Channel`
  String get create_new_channel {
    return Intl.message(
      'Create a New Channel',
      name: 'create_new_channel',
      desc: '',
      args: [],
    );
  }

  /// `Create an iPhone Contact`
  String get create_an_phone_contact {
    return Intl.message(
      'Create an iPhone Contact',
      name: 'create_an_phone_contact',
      desc: '',
      args: [],
    );
  }

  /// `Invite a Contact`
  String get invite_contact {
    return Intl.message(
      'Invite a Contact',
      name: 'invite_contact',
      desc: '',
      args: [],
    );
  }

  /// `Phone Contacts Matching`
  String get phone_contacts_matching {
    return Intl.message(
      'Phone Contacts Matching',
      name: 'phone_contacts_matching',
      desc: '',
      args: [],
    );
  }

  /// `Add your phone number`
  String get add_your_phone_number {
    return Intl.message(
      'Add your phone number',
      name: 'add_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Country or Region Codes`
  String get country_region_codes {
    return Intl.message(
      'Country or Region Codes',
      name: 'country_region_codes',
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

  /// `Display Name`
  String get display_name {
    return Intl.message(
      'Display Name',
      name: 'display_name',
      desc: '',
      args: [],
    );
  }

  /// `Profile Photo`
  String get profile_photo {
    return Intl.message(
      'Profile Photo',
      name: 'profile_photo',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get update_password {
    return Intl.message(
      'Update Password',
      name: 'update_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message(
      'Sign Out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message(
      'My Profile',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Name`
  String get edit_name {
    return Intl.message(
      'Edit Name',
      name: 'edit_name',
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

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Select from Photo Album`
  String get select_from_photo_album {
    return Intl.message(
      'Select from Photo Album',
      name: 'select_from_photo_album',
      desc: '',
      args: [],
    );
  }

  /// `Add Features`
  String get added_features {
    return Intl.message(
      'Add Features',
      name: 'added_features',
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

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `No channels to show`
  String get no_channel {
    return Intl.message(
      'No channels to show',
      name: 'no_channel',
      desc: '',
      args: [],
    );
  }

  /// `Verify your age`
  String get verify_your_age {
    return Intl.message(
      'Verify your age',
      name: 'verify_your_age',
      desc: '',
      args: [],
    );
  }

  /// `Birth Year`
  String get birth_year {
    return Intl.message(
      'Birth Year',
      name: 'birth_year',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your birth year.`
  String get please_confirm_your_birth_year {
    return Intl.message(
      'Please confirm your birth year.',
      name: 'please_confirm_your_birth_year',
      desc: '',
      args: [],
    );
  }

  /// `Or select your sign up method`
  String get select_your_sign_up_method {
    return Intl.message(
      'Or select your sign up method',
      name: 'select_your_sign_up_method',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continue_with_facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continue_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Other sign in methods`
  String get other_sign_in_methods {
    return Intl.message(
      'Other sign in methods',
      name: 'other_sign_in_methods',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Check your email for a code`
  String get check_your_email_for_a_code {
    return Intl.message(
      'Check your email for a code',
      name: 'check_your_email_for_a_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code sent to your email address`
  String get confirm_email_msg {
    return Intl.message(
      'Please enter the verification code sent to your email address',
      name: 'confirm_email_msg',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Did not get the code?`
  String get did_not_get_the_code {
    return Intl.message(
      'Did not get the code?',
      name: 'did_not_get_the_code',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name and set a password`
  String get enter_your_name_and_set_password {
    return Intl.message(
      'Enter your name and set a password',
      name: 'enter_your_name_and_set_password',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
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
      Locale.fromSubtags(languageCode: 'vn'),
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
