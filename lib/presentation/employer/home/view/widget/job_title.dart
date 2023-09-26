import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import '../../../../../core/resources/styles_manager.dart';



class JobTile extends StatelessWidget {
  final String jobID;
  final String jobTitle;
  final String jobDesc;
  final String uploadedBy;
  final String contactName;
  final String contactImage;
  final String contactEmail;
  final String jobLocation;
  final bool recruiting;

   JobTile({
    required this.jobID,
    required this.jobTitle,
    required this.jobDesc,
    required this.uploadedBy,
    required this.contactName,
    required this.contactImage,
    required this.contactEmail,
    required this.jobLocation,
    required this.recruiting,
  });


  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: HeightManager.h16 /2,
        bottom: HeightManager.h16 /2,
        left: 0,
        right: 0,
      ),
      child: Card(
        elevation: 5,
        color: ColorsManager.card,
        child: ListTile(
          onTap: () {

            // go to jobDetailsScreen
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => JobDetailsScreen(
            //           id: widget.uploadedBy,
            //           job_id: widget.jobID,
            //         )));
          },
          onLongPress: () {
            // _deleteDialog();
          },
          contentPadding:  EdgeInsets.all(WidthManager.w16 / 2),
          leading: Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1),
              ),
            ),
            child: Image.network(
             contactImage,
            ),
          ),
          title: Padding(
            padding:  EdgeInsets.only(bottom: HeightManager.h16 / 4),
            child: Text(
             jobTitle,
              style: getBoldTextStyle(fontSize: FontSizeManager.s20,color: ColorsManager.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: HeightManager.h16/ 4),
                  child: Text(
                 contactName,
                    style: getMediumTextStyle(fontSize: FontSizeManager.s16, color: ColorsManager.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: HeightManager.h16 / 4),
                  child: Text(
                jobDesc,
                    style: getMediumTextStyle(fontSize: FontSizeManager.s16, color: ColorsManager.black),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]),
          trailing:  Icon(
            Icons.keyboard_arrow_right,
            color: ColorsManager.black,
            size: IconSizeManager.s20,
          ),
        ),
      ),
    );
  }

  // _deleteDialog() {
  //   User? user = _auth.currentUser;
  //   final uid = user!.uid;
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(actions: [
  //         Padding(
  //           padding: .all(WidthManager.w16),
  //           child: Column(children: [
  //             const Text(
  //               'Are you sure you want to delete this job?',
  //               style: txt.subTitleDark,
  //             ),
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
  //               _textButtonDelete(user, uid),
  //               _textButtonCancel(),
  //             ]),
  //           ]),
  //         ),
  //       ]);
  //     },
  //   );
  // }
  //
  // Widget _textButtonDelete(User? user, uid) {
  //   return MainButton(
  //     width: double.infinity,
  //     height: HeightManager.h40,
  //     onPressed: () async {
  //       try {
  //         if (widget.uploadedBy == uid) {
  //           await FirebaseFirestore.instance
  //               .collection('jobPosted')
  //               .doc(widget.jobID)
  //               .delete();
  //           Navigator.canPop(context) ? Navigator.pop(context) : null;
  //           Navigator.canPop(context) ? Navigator.pop(context) : null;
  //           await
  //           Get.snackbar('The job has been successfully deleted =><','');
  //
  //         } else {
  //           Navigator.canPop(context) ? Navigator.pop(context) : null;
  //           Navigator.canPop(context) ? Navigator.pop(context) : null;
  //          // show in dialog
  //          //  'Unable to delete',
  //
  //         }
  //       } catch (error) {
  //         // show in dialog :
  //       //   title: 'Error',
  //       // body: 'Unable to delete job',
  //
  //       } finally {}
  //     },
  //     color: ColorsManager.secondary,
  //     child: Row(children: const [
  //       Icon(
  //         Icons.delete,
  //         color: Colors.red,
  //       ),
  //       Text(
  //         ' Yes',
  //         // style: txt.body2Dark,
  //       ),
  //     ]),
  //   );
  // }
  //
  //
  //
  //
  // Widget _textButtonCancel() {
  //   return MainButton(
  //     onPressed: () {
  //       Navigator.canPop(context) ? Navigator.pop(context) : null;
  //     },
  //     width: double.infinity,
  //     height: HeightManager.h40,
  //     color: ColorsManager.primary,
  //     child: Row(children: const [
  //       Icon(
  //         Icons.cancel,
  //         color: ColorsManager.primary,
  //       ),
  //       Text(
  //         ' No',
  //         // style: txt.body2Dark,
  //       ),
  //     ]),
  //   );
  // }
}