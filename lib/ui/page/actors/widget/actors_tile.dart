part of actors;

class ActorsTile extends StatelessWidget {
  final Actor actor;
  final Function function;

  const ActorsTile({Key? key, required this.actor, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actor.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Cost " + FormatCurrency().formattedCost(actor.cost),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () => function(),
                icon: const Icon(
                  Icons.add_circle,
                  size: 36,
                  color: BaseColors.redColor,
                ))
          ],
        ),
        verticalSpaceTiny,
        Text(
          actor.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
