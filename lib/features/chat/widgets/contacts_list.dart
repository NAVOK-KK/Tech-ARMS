import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/common/utils/colors.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_ui/features/chat/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/models/chat_contact.dart';
import 'package:whatsapp_ui/models/group.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<List<Group>>(
              stream: ref.watch(chatControllerProvider).chatGroups(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Loader());
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var groupData = snapshot.data![index];

                    return Column(
                      children: [
                        InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MobileChatScreen.routeName,
                              arguments: {
                                'name': groupData.name,
                                'uid': groupData.groupId,
                                'isGroupChat': true,
                                'profilePic': groupData.groupPic,
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Card(
                              margin: EdgeInsets.all(12),
                              color: Colors.amber,
                              elevation: 12,
                              child: ListTile(
                                title: Text(
                                  groupData.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'Lexend Deca'),
                                ),
                                subtitle: Text(
                                  groupData.lastMessage,
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: 'Lexend Deca'),
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: tabColor,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      groupData.groupPic,
                                    ),
                                    radius: 25,
                                  ),
                                ),
                                trailing: Text(
                                  DateFormat.Hm().format(groupData.timeSent),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontFamily: 'Merienda'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //const Divider(color: dividerColor, indent: 85),
                      ],
                    );
                  },
                );
              }),
          StreamBuilder<List<ChatContact>>(
              stream: ref.watch(chatControllerProvider).chatContacts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...'); //Loader();
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var chatContactData = snapshot.data![index];

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MobileChatScreen.routeName,
                              arguments: {
                                'name': chatContactData.name,
                                'uid': chatContactData.contactId,
                                'isGroupChat': false,
                                'profilePic': chatContactData.profilePic,
                                //  'publicKey': chatContactData.publicKey
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(
                                chatContactData.name,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                chatContactData.lastMessage,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    fontFamily: 'Lexend Deca'),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: appBarColor,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    chatContactData.profilePic,
                                  ),
                                  radius: 25,
                                ),
                              ),
                              trailing: Text(
                                DateFormat.Hm()
                                    .format(chatContactData.timeSent),
                                style: const TextStyle(
                                  fontFamily: 'Merienda',
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //  const Divider(color: dividerColor, indent: 85),
                      ],
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
