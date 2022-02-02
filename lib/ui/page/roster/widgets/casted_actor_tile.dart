part of roster;

class CastedActorsTile extends StatelessWidget {
  final Actor actor;
  final Function unCastAction;

  CastedActorsTile({Key? key, required this.actor, required this.unCastAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => unCastAction(),
          icon: const Icon(
            Icons.minimize_rounded,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            actor.name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Spacer(),
        Text(
          FormatCurrency().formattedCost(actor.cost),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
