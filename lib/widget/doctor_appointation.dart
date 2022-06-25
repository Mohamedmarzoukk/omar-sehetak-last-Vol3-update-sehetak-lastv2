import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorAppointation extends StatefulWidget {

  @override
  State<DoctorAppointation> createState() => _DoctorAppointationState();
}

class _DoctorAppointationState extends State<DoctorAppointation> {

  var fullNameController = TextEditingController();
  var phonenumberController = TextEditingController();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Book An Appointment',
          style: TextStyle(
              fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 25.0,
        backgroundColor: Colors.blue[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue[800],
              height: 150.0,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: NetworkImage('https://st.depositphotos.com/1771835/1477/i/950/depositphotos_14779771-stock-photo-portrait-of-confident-young-doctor.jpg') ,
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.fill,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Name doctor',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                child:RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (value)
                        {
                          if(value.isEmpty)
                            {
                              return 'Name must not be empty';
                            }
                          return null;
                        },
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                          prefixIcon:Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value)
                        {
                          if(value.isEmpty)
                          {
                            return 'phone must not be empty';
                          }
                          return null;
                        },
                        controller: phonenumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                          prefixIcon:Icon(Icons.phone),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 40.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 1.0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8),
                                ),
                              ),
                              width: 100.0,
                              height: 35.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 22.0,top: 3,),
                                child: Text('Today',
                                style: TextStyle(
                                  color: Colors.white,fontSize: 18.0),

                            ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0,bottom: 5.0,),
                              child: Container(
                                width: 75.0,
                                height: 50.0,
                                child: Text('6.00pm To 10.00pm',
                                  style: TextStyle(
                                    color: Colors.black,),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8),
                              ),
                              ),
                              height: 35.0,
                              width: 100.0,
                              child: MaterialButton(onPressed: (){},
                                child: Text('Book',
                                  style: TextStyle(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(8),
                              ),
                              color: Colors.blue,
                            ),
                            width: 100.0,
                            height: 35.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 3.0,),
                              child: Text('Tomorrow',
                                style: TextStyle(
                                    color: Colors.white,fontSize: 18.0),

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0,bottom: 5.0,),
                            child: Container(
                              width: 75.0,
                              height: 50.0,
                              child: Text('8.00pm To 12.00pm',
                                style: TextStyle(
                                  color: Colors.black,),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8),
                              ),
                            ),
                            height: 35.0,
                            width: 100.0,
                            child: MaterialButton(onPressed: (){},
                              child: Text('Book',
                                style: TextStyle(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 60.0),
              child: Container(
                color: Colors.blue[600],
                width: double.infinity,
                child: MaterialButton(onPressed: ()
                {
                  if(formKey.currentState.validate())
                    {
                      print(fullNameController.text);
                      print(phonenumberController);
                    }
                },
                child: Text('Make appointment',
                  style: TextStyle(
                      color: Colors.white),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

