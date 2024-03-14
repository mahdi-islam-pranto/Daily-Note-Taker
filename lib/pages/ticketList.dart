import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TicketList());
}

class Ticket {
  final String userName;
  final String name;
  final String dataType;
  final String uniqueId;
  final String commentId;
  final String pageId;
  final String status;

  Ticket({
    required this.userName,
    required this.name,
    required this.dataType,
    required this.uniqueId,
    required this.commentId,
    required this.pageId,
    required this.status,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      userName: json['user_name'],
      name: json['name'],
      dataType: json['data_type'],
      uniqueId: json['unique_id'],
      commentId: json['comment_id'],
      pageId: json['page_id'],
      status: json['status'],
    );
  }
}

class TicketList extends StatelessWidget {
  Future<List<Ticket>> fetchTickets() async {
    final response = await http.post(
      Uri.parse(
          'https://omni.ihelpbd.com/ihelpbd_social_1/api/v1/ticket_list.php'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'token': '1',
      },
      body: jsonEncode(<String, String>{
        'authorized_by': '3089271168052015',
        'username': 'user1',
        'role': 'user',
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((ticket) => Ticket.fromJson(ticket)).toList();
    } else {
      throw Exception('Failed to load tickets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ticket List'),
        ),
        body: FutureBuilder<List<Ticket>>(
          future: fetchTickets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].status),
                    onTap: () {
                      // Add onTap functionality if needed
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
