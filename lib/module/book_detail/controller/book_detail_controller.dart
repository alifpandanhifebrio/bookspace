
import 'package:flutter/material.dart';
import 'package:bookapp/core.dart';
import '../view/book_detail_view.dart';

class BookDetailController extends State<BookDetailView> {
    static late BookDetailController instance;
    late BookDetailView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    