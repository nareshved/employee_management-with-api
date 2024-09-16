import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key, required this.detailsEmployee});

  final EmployeeModel detailsEmployee;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Employee"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: mq.width,
            child: Card(
              margin: const EdgeInsets.all(11),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: detailsEmployee.avatar!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline),
                  ),
                ),
                title: Text(detailsEmployee.name!),
                subtitle: Row(
                  children: [
                    const Icon(
                      Icons.call,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: mq.width * 0.010,
                    ),
                    Text(detailsEmployee.mobile!)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            width: mq.width,
            child: Card(
              margin: const EdgeInsets.all(11),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.alarm)),
                    title: const Text("createdAt"),
                    subtitle: Text(detailsEmployee.createdAt!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.image)),
                    title: const Text("avatar"),
                    subtitle: Text(detailsEmployee.avatar!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.email)),
                    title: const Text("Email Id"),
                    subtitle: Text(detailsEmployee.emailId!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                        child: Icon(Icons.supervised_user_circle)),
                    title: const Text("Id"),
                    subtitle: Text(detailsEmployee.id!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.flag)),
                    title: const Text("Country"),
                    subtitle: Text(detailsEmployee.country!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.home)),
                    title: const Text("State"),
                    subtitle: Text(detailsEmployee.state!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.home)),
                    title: const Text("district"),
                    subtitle: Text(detailsEmployee.district!),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.email)),
                    title: const Text("Email"),
                    subtitle: Text(detailsEmployee.email!),
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
