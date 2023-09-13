import 'package:beelogix_task/Services/PhotoesServies/photoesServices.dart';
import 'package:beelogix_task/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


import '../../../Models/MdImages.dart';
class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PhotoService().getLoginData(context);

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:
      Obx((){
        List<Data>? response = photoesGalleryController.photoesResponseModel.value.data;
        debugPrint("response   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${response.toString()}");
        return
          response == null ? const Center(child: CircularProgressIndicator()) :
          Container(
              margin: EdgeInsets.all(12),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: response.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration:  const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(15))
                    ),
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        height: 600,
                        width: 600,
                        fit: BoxFit.cover,
                        imageUrl: response[index].url!,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    )

                  );
                }, staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.9 : 2.1);
              },
              )
          );
      })

    );
  }
}
