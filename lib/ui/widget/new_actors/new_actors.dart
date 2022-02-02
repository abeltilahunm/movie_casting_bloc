import 'package:flutter/material.dart';
import 'package:movie_casting_bloc/model/actors_model.dart';
import 'package:movie_casting_bloc/ui/shared/base_colors.dart';
import 'package:ui_helper/ui_helper.dart';

class NewActor extends StatelessWidget {
  final Function onSubmit;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _costController = TextEditingController();

  NewActor({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "New Actor/Actress",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
              verticalSpaceSmall,
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
              verticalSpaceTiny,
              TextField(
                controller: _descController,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              verticalSpaceTiny,
              TextField(
                keyboardType: TextInputType.number,
                controller: _costController,
                decoration: const InputDecoration(
                  hintText: "Cost",
                  border: OutlineInputBorder(),
                ),
              ),
              verticalSpaceMedium,
              ButtonWidget(
                title: "Submit",
                activeButtonColor: BaseColors.buttonColor,
                onTap: () {
                  int cost = int.parse(_costController.text);
                  Actor actor = Actor(
                    name: _nameController.text,
                    cost: cost,
                    description: _descController.text,
                  );
                  onSubmit(actor);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
