import 'package:flutter/material.dart';

class SDG {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  SDG({required this.title, required this.description, required this.icon , required this.color});
}
class SDGPage extends StatefulWidget {
  @override
  _SDGPageState createState() => _SDGPageState();
}

class _SDGPageState extends State<SDGPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  final List<SDG> sdgs = [
    SDG(
      title: "No Poverty",
      description: "End poverty in all its forms everywhere",
      icon: Icons.money,
      color: Colors.orange[300]!
    ),
    SDG(
      title: "Zero Hunger",
      description:
      "End hunger, achieve food security and improved nutrition and promote sustainable agriculture",
      icon: Icons.local_dining,
        color: Colors.redAccent
    ),
    SDG(
      title: "Good Health and Well-being",
      description:
      "Ensure healthy lives and promote well-being for all at all ages",
      icon: Icons.favorite,
        color: Colors.pinkAccent
    ),
    SDG(
      title: "Quality Education",
      description:
      "Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all",
      icon: Icons.school,
        color: Colors.lightBlue
    ),
    SDG(
      title: "Gender Equality",
      description: "Achieve gender equality and empower all women and girls",
      icon: Icons.person,
        color: Colors.purpleAccent
    ),
    SDG(
      title: "Clean Water and Sanitation",
      description:
      "Ensure availability and sustainable management of water and sanitation for all",
      icon: Icons.opacity,
        color: Colors.blue[600]!
    ),
    SDG(
      title: "Affordable and Clean Energy",
      description:
      "Ensure access to affordable, reliable, sustainable and modern energy for all",
      icon: Icons.battery_charging_full,
        color: Colors.yellowAccent
    ),
    SDG(
      title: "Decent Work and Economic Growth",
      description:
      "Promote sustained, inclusive and sustainable economic growth and decent work for all",
      icon: Icons.work,
        color: Colors.orangeAccent
    ),
    SDG(
      title: "Industry, Innovation and Infrastructure",
      description:
      "Build resilient infrastructure, promote inclusive and foster innovation",
      icon: Icons.build,
        color: Colors.blueAccent
    ),
    SDG(
      title: "Reduced Inequalities",
      description: "Reduce inequality within and among countries",
      icon: Icons.compare_arrows,
        color: Colors.deepOrangeAccent
    ),
    SDG(
      title: "Sustainable Cities and Communities",
      description:
      "Make cities and human settlements inclusive, safe, resilient and sustainable",
      icon: Icons.location_city,
        color: Colors.greenAccent
    ),
    SDG(
      title: "Responsible Consumption and Production",
      description: "Ensure sustainable consumption.",
      icon: Icons.shopping_cart,
        color: Colors.teal
    ),
    SDG(
      title: "Climate Action",
      description:
      "Take urgent action to combat climate change and its impacts",
      icon: Icons.cloud,
        color: Colors.lightGreen
    ),
    SDG(
      title: "Life Below Water",
      description:
      "Conserve and sustainably use the oceans, seas and marine resources for sustainable development",
      icon: Icons.beach_access,
        color: Colors.blueGrey
    ),
    SDG(
      title: "Life On Land",
      description:
      "Protect and promote sustainable use of terrestrial ecosystems.",
      icon: Icons.nature,
        color: Colors.brown[300]!
    ),
    SDG(
      title: "Peace, Justice and Strong Institutions",
      description:
      "Promote peaceful and inclusive societies for sustainable development.",
      icon: Icons.gavel,
        color: Colors.blueGrey[400]!
    ),
    SDG(
      title: "Partnerships for the Goals",
      description:
      "Strengthen the means of revitalize the global partnership for sustainable development",
      icon: Icons.people,
        color: Colors.pink
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage('assets/charity.png'),
        ),
        title: Text('Donate via SDGS', style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/donation.jpg'),
              fit: BoxFit.cover),
        ),
        child:  Column(
            children : [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search SDGS',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchText = _searchController.text;
                });
              },
            ),
          ),
        ),
      ),
      Expanded(
        child: GridView.builder(
          itemCount: sdgs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            SDG sdg = sdgs[index];
            return GestureDetector(
              onTap: () {
                // TODO: Navigate to corresponding SDG page
              },
              child: Card(
                color: sdg.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(sdg.icon, size: 48),
                    SizedBox(height: 8),
                    Text(
                      sdg.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      sdg.description,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

    ])) );
  }
}
