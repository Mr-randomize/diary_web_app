import 'package:diary_web_app/model/user.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final MUser currentUser;

  @override
  Widget build(BuildContext context) {
    final _avatarUrlTextController = TextEditingController();
    final _displayNameTextController = TextEditingController();
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(currentUser.avatarUrl!),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Editing ${currentUser.displayName!}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Form(
                                        child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _avatarUrlTextController,
                                        ),
                                        TextFormField(
                                          controller:
                                              _displayNameTextController,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.green,
                                                elevation: 4,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(15)),
                                                    side: BorderSide(
                                                        color: Colors.green,
                                                        width: 1))),
                                            child:const Text('Update'),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    )),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
              Text(
                currentUser.displayName!,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              size: 19,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
