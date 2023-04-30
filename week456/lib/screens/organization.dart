import 'package:flutter/material.dart';
class CharityOrganization {
  final String name;
  final String imageUrl;
  CharityOrganization({
    required this.name,
    required this.imageUrl,
  });
}
class CharityOrganizationPage extends StatefulWidget {
  @override
  State<CharityOrganizationPage> createState() => _CharityOrganizationPageState();
}
class _CharityOrganizationPageState extends State<CharityOrganizationPage> {
  final List<CharityOrganization> organizations = [
    CharityOrganization(
        name: 'Edhi Foundation',
        imageUrl:
        'assets/edhi.jpg'),
    CharityOrganization(
        name: 'JDC Foundation',
        imageUrl:
        'assets/JDC_Foundation_Logo.png'),
    CharityOrganization(
        name: 'The Citizen Foundation',
        imageUrl:
        'assets/The-Citizen-Foundation.png'),
    CharityOrganization(
        name: 'Saylani Welfare Trust',
        imageUrl:
        'assets/Saylani.jpg'),
    CharityOrganization(
        name: 'Alkhidmat Foundation',
        imageUrl:
        'assets/alkhidmat.png',),
    CharityOrganization(
        name: 'Akhuwat Foundation',
 //gIWzJv+djMZIY2CeVyjH6Z1zJeU9xsAPupvLzSeZNgoPovSHenIf+Pa76/0aXTTIum8qvfGtWGnyJ5UluEW/lxikh/FxlHONCfiLbUH+c3JRVxQqSww7i9cbODeb23se4EtmxpPufMwxzJ/GWpcaE99o58NC/1ec4l3LyNe3/KWBw33HGpOM8VjHvk/OEuXOVWNe6u9O+ra4vLmOGSUybqz76/NjQY4jhHXv9Hqp4M2eDisCNDGb2oi2KYy4BXhPzqB4TN0huYPaiC5dxNyMxXF/fudxsUAXRVQ1xX/z3Avt+73NXBrMgFUUzCRF3Ww/x2oj7vfPkc3sHM0EVROdNYl7yier7iRo6tnSt3FyPB1E70ag7ZKS8uTb4iWeqZRp3zB78uFLp5H5G41bNO9zPQxxUK15Hm3kMOrmAe1zJWQzlCX9b7UTz7gp3uJcAHjFc9Vb3FTWOnPczsHR9Q3p/Eb2kwh1qo8+B32dF92iomeAwOaTcOZ1Sg/vrhOlwIneo3d1Dj6EpckPNhHg/+if2LYoEzr16EoVbse4wmclxoFKNgVOf7T+M2+Cgo45M1tCLYilRnOB7L2fkZqZBouRT0FKThAfOBn15PH1eIS1xh/j5weEx61BjJ4yUOO0xa6paMbjDanXqyCTlVZNfAjjwqqw/dVyWGAyphwfsUBN72C3iK+WmJJfy2Ekr1oNbriU7S4UEFECm2hRXAP7+eSpHLu4Im5SaXHdgXyoK1y9Nph55e08xYuZ6fC10phmf4vSg/cX4wUlF6Eh1YCccs0o+4Aaua34tgOe8aniVC/MQductKls31IDFUhsaAjKNv3sSFIFUHt7K+yHNRFI2wlas5ABCUoJbcK8VderqSb5o6NktWPBYzOS6UpV6UFQzhk89eBgHnp3qvQReMeS8ioCC3mwmirKrdm3ncsGkyVA4saKGnyfRxnPe8yAUN5iwMmbesmXnqjllBIn989nMY+FU71Zx+dLgzFUr4YwcvH+uDzqKstHDlHsfnHhCC54AjqWhp/qMAwk8V7kdhODme2P1G3mfZGXnOkqhIz8QOLf2LA8MJRsZy+DVztPk4oX/XosuNxnnPPminqyxn1W5DSxwDuSnVa08SeQ38qDPed71xFyLmbeawg6OZVUg0x6IbQ6eZbAg6FBRvs15lUfx3geeDK62USQI9cos1fC9YiLIAoRWw+uqoitkoMLIUswAX6aTu4b3P1DvHbW5tZLT3cjydu/hU0d+/PhiEHvwXtdEiejH6p1hhXaOgS/V3RwmHzhm8RUumvfgqaJDgoXizbGWGg0A6cENtc2woT/zB/Nef62ObdZfMe/Bo5YaLjKNT1QjUu+N3qFOmT45m6wtGW7OlmyRt+f4vElJY9e+sAmc8bPGrH0Uxd0g+WkCJ57Db/NkALflLPc9sDIy9kxXCOY6zNTyuA1EiS2Q/JnY+Y1maNIGJ0af+NBnZiInDPACpIPBrelx4Dhu6OBG9XT8Xv1QZNIWDrIDw2WH/aCQfzTeNq2DlWQlDDbq4dbM5eckt5Y780zgA5qbyHmlIJ2hkoiExbY/SJK/XttuzKhxX+TkTDz5GWVJZqVMnHm6tunEe7Zxo75tGYvRYfnn3lhVZr80Fr2PZuS2L3OeraCQczeZzN7vYAK2UDdPLZa0XEndppEwE9kD6/OcBG70hjG0oSt6NWIMLiHEuND/M4a69XP4qkTvwTxTbnGgE0WdjdJLHFM0KDyO8YWsZWMqXG/hB9FtL6yVOIZEOyy3VjsxzGSaNZoY3WjVU4pueVPt/dKVZGFFZyjj6NerTrXXzhruJ3BrFpSiu9bwg9IXfb0ZRnQPNnIMnnohr5SL3JVq4NHNe/ptGubSZiL47K41xVw7k8jOUB2YUb23Zmo4hNjqTWtvSvL2PprNWdNii1gLFEt3ysONNiztldnswVWHEslMomobi2VOxSzKkmmkKFaJtcPONjVhBpcuEiVahl/80svgefqHLDsUazGtlWrMDdJYHqe2FdmhTO1Owq572cU6r6HtVlLWtNllXBsJZHg7nYHKm22nw/bUdcDIcjCVyqVtZMNp7to+mT61DNVFJEvfYhI3TXbiTbdTJISM7RNKYu/CmeGzk+qsLBtKSV0kNYmYfYYuGsKt5U4vg9uQZi5635DuxMvF99kmUVd49QiCQwmF7VWS2PHP5dq4QANEcChhshPkRZJ+g7SkX3wUBb5WM57YvNo5HiRMjUW3RC0JzFAmDctJS84zlMHjBHI4MO3z9dXOSVrUhPzYSg72CFujJaJOzono5ebEuh7D2v20LB2mT41lnDOrkqeyxgmklC0EyrWxGmKGYpzyqWRGjWRoLCoCQzEkJ2E3liUmN1W9yj36DoremygbktKXoX5xmuay+pK4msv+9zVNeZO/5KhXdxIvlU0vJb0p4NkmfSWfyEuTEURvDEjhhiV5dcI2I9FaQ/X5xqtiUW4o4mtjsxc45Vytel6l0qlUn09ObpGcPOfQUYV7+tkWvvHkoFPxMG6lUj15fDq4GQyF1aThzfj6OFchbaZ/LSVJGY4PDg5+3tzY/Bui//kzwyD5Ii/yIi/yIi/yIi/yIi/yIrOQha31LXhcYgIPpM+Fb6Sv+IF0iqPpxoBR0oh4/rqLZJ0fb7mBzNMvsew4jgv+dpxX7HDBWWR/r+KvToMj5yz465Ree/XwlMId0m/maLdz/qWoLLsaEbkPu8VidxVwr5TdYrFYd8+2yEEZHbjuMsJZw58X3fIy6WfJxd+03RXUaof83XXPFvFX50suumbZ/eKsntFTKN2523VpV/NL+Ct3LdDxF3SF9jmEwqhdcrr/B78rIm6xjjoRPlpuF+s7QavDctFdDB4FujZ/NCt1fsM76O9DfuHVbvmUPNd5dEqZfY5a1ZdYo7WiyyyjhDHqZ8Ehuou1OSSriPfsAv2BbgQaheNcuPWzOiOjunCLZfpk0fMrsme5gCDA03pd5l+tlIvtZf7Vqza9I3JKwF0iKg6OFlxwD/M+RnAfO3Vf94tucKOuxHhaLq8jzEOZ+7X/J1Kxy4yIQPDhgbnnJ3A7S3Xe6IJwX7BeuF04O+U1xMge31Ldvz3OvdplJ/oqQJqtC2qE3KVyvbvCPo/C/arNn91ht47NiR6dlrmZLLioPb6rgLvtn8O5F1yBew4fYuOBH3LupTK3uWjc6GEWu/TTtfIKUn/Ahm6CtV9uI+vF16M2vERviXM7K4KdIOdBrh3Yhch92i62wSiOwu1gT+BDbLntZTTQ6NG6y54D1k+RmFHwMLYoP+BeWBdIyMllgYdxn7viII7Efcq+QUrdQiD0nPM2f8Zb2EzIsG07ggBuQZZ9q8GGMsc/pdy8D8jND8NxI4dUXqFt6piNPtqdOlfBqzbRz+uy5DSM3Gjc0q/LfPhRP4go24KbIdzthUBKX0Jxl9jNutgKsKP3P67vsOZr9WJwi9x2LNwLgY2J4QgHi+JauQjHZMBd5HEXW9dkbkxKtLlInu15OzjiXnDL9e265EqOzcTNbOxQ6BZz17v1ouhlFO56OG5E2n7lEA9cIj6AAB92uRdE36wHV4H2auQ+q7u67zH32SF2Wa6QKWLu7mIg6zv1UNxb9NpnZWIY3SIxEGoaRMqBR8SG8mUy9xZ3RWXISO0bGU+9CLPHSOPScYrECy1Qw0D+hRyx+IPgWGPRYZm4V9vFNSpFmI1Rf4JDRnkHtI/kBx0a1uZdXzHzJNOYB+EPGSnAEFyYnhtnq1TaRTAKgf8uusClROT248nrbj24CPoOBXl2IZQJQAyoKS33OnJF88tUoKGwePm6K9z/BG6eJaGR1ubcOEc9c7pdapNrdXRU5n73wi1/CShQBi3k2VruQ5hiIbNjKuL5yZowNi3c6HToelfKUPvYTVyw0gabDfKCy/wyICijsQ7P1HJ34SDDOWaQ53DuLeIRecZs5F6GeTZuCBMErMWzevA1YakzbeCnwZvOu0LU0HEvukIyhTtel7mxZyqWgzMt3CVhDC/V62vg0luk8GP9Y10U2fdzwLPQLrjz1XGjobEoHLJsDMbbQxzbTzmcod4hCi+vLW+VSlvLxbJUVGFzI7GHCLIFnoXjjBQGCWworCV2aRL3xZcuyknO2VBExSJSw+pFybk4xX+uHc77z3UJj9jXywuoGMfd11+fE6TS8k4ZKxGfQWQVxc9623cKdTEfc3CZyO/kHA8+qrK5FYTxejnAIBctrr0i4640f4rL4uLpOddviTqeYFSz4L21IE4qOPR4nU8qkEA3z88INLHmtlHkq5fb7pIQZklkafMHtcWPgs5OxUN/RoJ3wc8tzc8RWRQP5+ZLC8Gfc7TzLfL5ghN8PHfBPvXP4E/1/HRlZ+V0WaLGCl99dSEcUfsKOqPPYoH1IXQxF1jj/wAbPGEHzumUfQAAAABJRU5ErkJggg=='),
    imageUrl :'assets/akhuwat.png' ),
  CharityOrganization(
        name: 'Aman Foundation',
        imageUrl:
        'assets/aman.jpg'),
    CharityOrganization(
        name: 'Dar-ul-Sukun Foundation',
        imageUrl:
        'assets/dar-ul-sukun.png'),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image(
            image: AssetImage('assets/charity.png'),
          ),
          title: Text('Donate to Organizations',
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/donation.jpg'), fit: BoxFit.cover),
          ),
         child :  Column(
         children : [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: TextField(
             controller: _searchController,
             decoration: InputDecoration(
               hintText: 'Search Organizations',
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: organizations.length,
            itemBuilder: (BuildContext context, int index) {
              CharityOrganization organization = organizations[index];
              return InkWell(
                onTap: () {
                  // TODO: Navigate to organization detail page
                },
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Expanded(
                        child: Image.asset(
                          organization.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          organization.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement donation functionality
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfff43838)),
                            child: Text('Donate'),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to organization detail page
                            },
                            child: Text('Details',
                                style: TextStyle(color: Color(0xff000000))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
       ]),
        ));
  }
}
