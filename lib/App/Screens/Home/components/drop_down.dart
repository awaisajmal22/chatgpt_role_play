import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final List<T> options;
  final T value;
  final void Function(T) onChanged;
  AppDropdownInput({
    this.options = const [],
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.062,
          width: MediaQuery.of(context).size.width * 0.21,
          child: FormField<T>(
            builder: (FormFieldState<T> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.black.withOpacity(0.5)
                                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                isEmpty: value == null || value == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    icon: SvgPicture.asset(
                      'assets/icons/dropdown.svg',
                    ),
                    value: value,
                    isDense: true,
                    onChanged: (value) {
                      onChanged(value!);
                    },
                    items: options.map((T value) {
                      return DropdownMenuItem<T>(
                          value: value,
                          child: value == ''
                              ? const SizedBox.shrink()
                              : Text(value.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.black.withOpacity(0.5)
                                  )));
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
     const   SizedBox(
          width: 20,
        )
      ],
    );
  }
}