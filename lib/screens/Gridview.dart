import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/photo_provider.dart';
import 'detail.dart';

class PhotoGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text(
            'Photo Grid App',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.menu),
          // actions: [Icon(Icons.search)],
          backgroundColor: Colors.teal,
        ),
      ),
      body: Consumer<PhotoProvider>(
        builder: (context, photoProvider, child) {
          if (photoProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed:(){},style:ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ) , child: const Text("Albums",style: TextStyle(color: Colors.white),),),
                      const Icon(Icons.search)
                    ],

                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: photoProvider.photos.length,
                      itemBuilder: (context, index) {
                        final photo = photoProvider.photos[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoDetailScreen(
                                  initialIndex: index,
                                  photos: photoProvider.photos,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.teal, width: 2.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13.0),
                              child: Image.network(
                                photo.thumbnailUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
