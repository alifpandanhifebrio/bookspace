// import 'package:flutter/material.dart';
// import 'package:bookapp/core.dart';


// class CardBook extends StatefulWidget {
//   final String tgl_telusur;
//   final String kriteria;
//   final String noPol;
//   final String nmPenelusur;
//   final Function() onTap;

//   const CardBook({
//     Key? key,
//     required this.tgl_telusur,
//     required this.kriteria,
//     required this.noPol,
//     required this.nmPenelusur,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   State<CardBook> createState() =>
//       _CardVerifikasiusuranState();
// }

// class _CardVerifikasiusuranState extends State<CardBook> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//             side: const BorderSide(
//               color: gray200,
//               width: 1,
//             ),
//           ),
//           child: InkWell(
//             onTap: widget.onTap,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: SvgPicture.asset(
//                         "assets/background/card_riwayat.svg",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               OneData(
//                                 title: "Nomor Polisi",
//                                 subtitle: widget.noPol,
//                               ),
//                               OneData(
//                                 title: "Tgl. Telusur",
//                                 subtitle: widget.tgl_telusur,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           OneData(
//                             title: "Penelusur",
//                             subtitle: widget.nmPenelusur,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         OneData(
//                           title: "Kriteria",
//                           subtitle: widget.kriteria,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//       ],
//     );
//   }
// }
