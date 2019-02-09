class Building{
  final String id;
  final String name;
  final String location;
  final String image;
  final String imageBig;
  const Building({this.id,this.name, this.location, this.image, this.imageBig});

}

List<Building> building =[
  const Building(
    id:"1",
    name: "Centre For Advanced Research, Innovation And Entrepreneurship",
    location: "North Oshawa",
    image: "assets/pictures/building1.png",
    imageBig: "assets/pictures/building1Full.jpg"
  ),
  const Building(
    id:"2",
    name: "SIRC",
    location: "North Oshawa",
    image: "assets/pictures/SIRC.png",
  ),
  const Building(
    id:"3",
    name: "ACE",
    location: "North Oshawa",
    image: "assets/pictures/ACE.png",
  ),
];