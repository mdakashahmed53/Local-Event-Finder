import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/screens/home/widgets/event_card.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../event/event_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<EventProvider>().loadEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Event Finder'), centerTitle: true),
      body: Consumer<EventProvider>(
        builder: (context, provider, _) {

          if(provider.isLoading){
            return Center(child: CircularProgressIndicator());
          } else if(provider.hasError){
            return Center(child: Text(provider.errorMessage!));
          } else if(provider.events.isEmpty){
            return Center(child: Text('No events found'));
          }

          return ListView.builder(
            itemCount: provider.events.length,

            itemBuilder: (context, index) {
              final event = provider.events[index];
              return EventCard(event: event, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(eventId: event.id)));
              });
            },
          );
        }
      ),
    );
  }
}
