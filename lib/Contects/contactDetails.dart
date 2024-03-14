import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  List<String> contacts = [];
  List<String> emails = [];
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD6E2EA),
        title: Text('Your Contact Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contacts.isEmpty
                  ? Center(
                      child: Text(
                        'No Contacts added yet! Please add using the + button below. Else no alert will be send except the default app',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Text(
                      'All Contacts',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: contacts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(contacts[index]),
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete), 
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        contacts.removeAt(index);
                        emails.removeAt(index);
                      });
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('Contact: ' + contacts[index]),
                        subtitle: Text('Email: ' + emails[index]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Contact'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,  // Set the mainAxisSize to min
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: contactController,
                        decoration: InputDecoration(hintText: 'Enter Contact'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20), // You can adjust this value as needed
                    Flexible(
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: 'Enter Email Id'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (contactController.text.isEmpty || emailController.text.isEmpty) {
                        // show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter some text'))
                        );
                      } else {
                        setState(() {
                          contacts.add(contactController.text);
                          emails.add(emailController.text);
                          contactController.clear();
                          emailController.clear();
                        });
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
