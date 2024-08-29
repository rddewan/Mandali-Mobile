part of common;

class CheckboxWidget extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final Widget? widgetTitle;
  final Widget? widgetSubTitle;
  final bool? value;
  final bool? dense;
  final FormFieldValidator<bool>? validator;
  final Function(bool?) onChanged;
  final ListTileControlAffinity controlAffinity;
  final Color? sideColor;

  const CheckboxWidget({
    this.title,
    this.subtitle,
    required this.value,
    required this.validator,
    required this.onChanged,
    this.widgetTitle,
    this.widgetSubTitle,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.sideColor,
    this.dense,
    super.key,
  }) : assert(
          (title == null) || (widgetTitle == null),
          'Title should be null when widgetTitle is not null',
        );

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    final subtitle = widget.subtitle;

    return FormField(
      validator: widget.validator,
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: widget.dense,
            leading: Checkbox.adaptive(
              isError: field.hasError,
              value: widget.value,
              side: field.hasError
                  ? const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    )
                  : null,
              onChanged: (value) {
                widget.onChanged(value);
                field.didChange(value);
                field.validate();
              },
            ),
            title: widget.widgetTitle ?? Text(widget.title ?? ''),
            subtitle: widget.widgetSubTitle ?? Text(subtitle ?? ''),
          ),
          if (field.hasError) ...[
            Padding(
              padding: const EdgeInsets.only(left: kXXXXLarge),
              child: Text(
                field.errorText!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.red,
                    ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
