

class homemodel{
  dynamic id;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic category;
  dynamic image;
  rating? Rating;

  homemodel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.Rating,
  });
  homemodel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title=json['title'];
    price=json['price'];
    description=json['description'];
    category=json['category'];
    image=json['image'];
    Rating=rating.formJson(json['rating']);

  }


}
class rating{
  dynamic count ;
  dynamic rate ;

  rating({
    required this.count,
    required this.rate,
  });
  rating.formJson(Map<String,dynamic>json){
    count=json['count'];
    rate=json['rate'];
  }
}