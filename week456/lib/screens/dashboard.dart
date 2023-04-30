
import 'package:bytewisefellowship/week456/sdg.dart';
import 'package:flutter/material.dart';
import 'organization.dart';
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
        image: AssetImage('assets/charity.png'),
    ),),*/
      body:Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/home.jpg'),
        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
    fit: BoxFit.cover),
    ),
      child:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Welcome, Amna",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 20),
              Text(
                "How would you like to donate?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home, size: 40 , color: Colors.black),
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold, ),
                    ),
                    subtitle: Text(
                      "See your Donations",
                      style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold,
                        color: Colors.black54,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios , color: Colors.black),
                  ),

                  SizedBox(height: 10),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.location_on, size: 40 , color: Colors.black),
                    title: Text(
                      "Donate by Location",
                      style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text(
                      "Donate to charities in your local area",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                        color: Colors.black54,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios , color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SDGPage()),
                      );
                    },
                    leading: Icon(Icons.filter_list, size: 40 , color: Colors.black),
                    title: Text(
                      "Donate by SDG",
                      style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text(
                      "Donate to charities working towards a specific Sustainable Development Goal",
                      style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold,
                        color: Colors.black54,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios , color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>CharityOrganizationPage()),
                      );
                    },
                    leading: Icon(Icons.group, size: 40 , color: Colors.black),
                    title: Text(
                      "Donate by Organization",
                      style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text(
                      "Donate to charities that you support",
                      style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold,
                        color: Colors.black54,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios , color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_box, size: 40 , color: Colors.black),
                    title: Text(
                      "Your Account",
                      style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text(
                      "Setting Your Profile",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                        color: Colors.black54,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios , color: Colors.black),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    ) );
  }
}
