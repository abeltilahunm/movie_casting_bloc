part of roster;

class RosterScreen extends StatelessWidget {
  const RosterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(
        automaticallyImplyLeading: false,
        title: "Roster",
        centerTitle: false,
        popupMenuText: "Actors and Actress",
        showAction: true,
        onSelected: context.read<RosterBloc>().onSelected,
      ),
      body: BlocBuilder<RosterBloc, List<Actor>?>(
        builder: (BuildContext context, state) {
          // logger.d('message');
          if (state == null || state.isEmpty) {
            context.read<RosterBloc>().getCastedActors();
          }
          return state == null
              ? loadingSpinnerWidget
              : state.isEmpty
                  ? const Center(
                      child: Text("You don't have any casted actors"),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Row(
                              children: const [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Cost",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          verticalSpaceSmall,
                          Expanded(
                            child: ListView.builder(
                                itemCount: state.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: CastedActorsTile(
                                      unCastAction: () => context
                                          .read<RosterBloc>()
                                          .removeCastedActors(state[index]),
                                      actor: state[index],
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: BaseColors.greyColor,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total ",
                              ),
                              const Spacer(),
                              Text(
                                context.read<RosterBloc>().formattedCost,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          verticalSpaceLarge,
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
