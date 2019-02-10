class Building{
  final String id;
  final String name;
  final String location;
  final String image;
  final String imageBig;
  final String open;
  final String squareMeter;
  const Building({this.id,this.name, this.location, this.image, this.imageBig,this.open, this.squareMeter} );

}

List<Building> building =[
  const Building(
    id:"1",
    name: "Centre For Advanced Research, Innovation And Entrepreneurship",
    location: "North Oshawa",
    image: "assets/pictures/building1.png",
    imageBig: "assets/pictures/building1Full.jpg",
    open: "First Phase of Construction",
    squareMeter: "12,000 square metres"
  ),
  const Building(
    id:"2",
    name: "Software and Informatics Research Centre (SIRC)",
    location: "North Oshawa",
    image: "assets/pictures/SIRC.png",
      open: "Finshed in 2017",
    squareMeter: "7,600 square metre",
  ),
  const Building(
    id:"3",
    name: "Automotive Centre of Excellence Wind Tunnel (ACE)",
    location: "North Oshawa",
    image: "assets/pictures/ACE.png",
    squareMeter: "16,300 square metres.",
    open: "Finshed in 2003",
  ),
];