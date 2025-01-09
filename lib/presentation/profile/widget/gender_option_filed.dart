import 'package:flutter/material.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../domain/auth/entity/gender.dart';
import '../../../core/constant/constant.dart';

class GenderOptionFiled extends StatelessWidget {
  final GenderType initialValue;
  final void Function(GenderType?) onSavedFunction;
  final TextEditingController _controller = TextEditingController();

  GenderOptionFiled(
      {super.key, required this.onSavedFunction, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    _controller.text = initialValue.toShortString();
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      readOnly: true,
      onTap: () {
        _selectGender(context);
      },
      decoration: const InputDecoration(
        hintText: "Gender",
        prefixIcon: Padding(
            padding:
                EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
            child: Icon(Icons.six_ft_apart_outlined)),
      ),
    );
  }

  Future<void> _selectGender(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Padding(
                  padding: const EdgeInsets.only(top: defaultPadding),
                  child: Text("Select Gender",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).primaryColor),),
                ),
                ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: GenderType.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          
                          title: Text(GenderType.values[index].toShortString()),
                          onTap: ()  {
                            _controller.text = GenderType.values[index].toShortString();
                            onSavedFunction(GenderType.values[index]);
                            AppNavigator.pop(context);
                          },
                        ),
                        const Divider(
                            height: 5,
                          ),
                        
                      ],
                    );
                  },
                      ),
              ),
            ],
          ),
        ));
  }
}
