import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../service/firestore_services.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Friends"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: FireStoreService.instance.getFriendsStream(),
          builder: (c, snap) {
            if (snap.hasData) {
              List<UserModel> friends = snap.data?.docs
                  .map((e) => UserModel.froMap(e.data()))
                  .toList() ??
                  [];

              return friends.isEmpty
                  ? const Center(
                child: Text("You have no friends !!"),
              )
                  : ListView.builder(
                itemCount: friends.length,
                itemBuilder: (c, i) {
                  UserModel userModel = friends[i];

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        'chat_page',
                        arguments: userModel,
                      );
                    },
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(userModel.photoURL),
                    ),
                    title: Text(userModel.displayName),
                    subtitle: Text(userModel.email),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}