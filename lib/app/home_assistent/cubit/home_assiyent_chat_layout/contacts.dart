// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

// class Contacts extends StatelessWidget {
//   const Contacts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(15),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 cursorColor: Colors.black,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(CupertinoIcons.search),
//                   hintText: 'Search',
//                   filled: true,
//                   fillColor: const Color.fromRGBO(247, 246, 252, 1),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(18)),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text('Your Contacts:'),
//               ),
//               ListTile(
//                 title: Text('Mohammed'),
//                 subtitle: Text('01025468795'),
//                 trailing: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
//                     child: Text(
//                       'Add',
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         gradient: LinearGradient(colors: [
//                           Color.fromRGBO(121, 102, 255, 1),
//                           Color.fromRGBO(134, 143, 231, 1),
//                           Color.fromRGBO(158, 183, 255, 1),
//                         ]))),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:typed_data';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> _contacts = const [];
  String? _text;

  final _ctrl = ScrollController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await Permission.contacts.request();
      final sw = Stopwatch()..start();
      final contacts = await FastContacts.getAllContacts();
      sw.stop();
      _contacts = contacts;
      _text = 'Contacts: ${contacts.length}\nTook: ${sw.elapsedMilliseconds}ms';
    } on PlatformException catch (e) {
      _text = 'Failed to get contacts:\n${e.details}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.search),
                    hintText: 'Search',
                    filled: true,
                    fillColor: const Color.fromRGBO(247, 246, 252, 1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Your Contacts:'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            controller: _ctrl,
            isAlwaysShown: true,
            interactive: true,
            showTrackOnHover: true,
            thickness: 24,
            child: ListView.builder(
              controller: _ctrl,
              itemCount: _contacts.length,
              itemExtent: _ContactItem.height,
              itemBuilder: (_, index) =>
                  _ContactItem(contact: _contacts[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  static final height = 72.0;

  final Contact contact;

  String get _subtitle {
    final phones = contact.phones.join(', ');
    final emails = contact.emails.join(', ');
    final name = contact.structuredName;
    return [
      if (phones.isNotEmpty) phones,
      if (emails.isNotEmpty) emails,
      if (name != null)
        [
          if (name.namePrefix.isNotEmpty) name.namePrefix,
          if (name.givenName.isNotEmpty) name.givenName,
          if (name.middleName.isNotEmpty) name.middleName,
          if (name.familyName.isNotEmpty) name.familyName,
          if (name.nameSuffix.isNotEmpty) name.nameSuffix,
        ].join(', '),
    ].join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListTile(
        leading: _ContactImage(contact: contact),
        title: Text(contact.displayName),
        trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(121, 102, 255, 1),
                  Color.fromRGBO(134, 143, 231, 1),
                  Color.fromRGBO(158, 183, 255, 1),
                ]))),
      ),
    );
  }
}

class _ContactImage extends StatefulWidget {
  const _ContactImage({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  __ContactImageState createState() => __ContactImageState();
}

class __ContactImageState extends State<_ContactImage> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _imageFuture,
      builder: (context, snapshot) => Container(
        width: 56,
        height: 56,
        child: snapshot.hasData
            ? Image.memory(snapshot.data!, gaplessPlayback: true)
            : const Icon(Icons.account_box_rounded),
      ),
    );
  }
}
