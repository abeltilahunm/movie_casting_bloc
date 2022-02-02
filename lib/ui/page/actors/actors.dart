part of actors;

class ActorsList extends StatelessWidget {
  const ActorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(
        automaticallyImplyLeading: false,
        title: "Actors and Actress",
        centerTitle: false,
        popupMenuText: "Roster",
        showAction: true,
        onSelected: context.read<ActorsBloc>().onSelected,
      ),
      body: BlocBuilder<ActorsBloc, List<Actor>?>(
        builder: (context, state) {
          if (state == null || state.isEmpty) {
            context.read<ActorsBloc>().getAllActors();
          }
          return state == null
              ? const Center(
                  child: Text('Null'),
                )
              : state.isEmpty
                  ? const Center(
                      child: Text("Empty"),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.only(bottom: 20),
                                itemCount: state.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ActorsTile(
                                    actor: state[index],
                                    function: () => context
                                        .read<ActorsBloc>()
                                        .castActors(state[index]),
                                  );
                                }),
                          ),
                          verticalSpaceSmall,
                          ButtonWidget(
                            height: 58,
                            activeButtonColor: BaseColors.buttonColor,
                            onTap: () =>
                                context.read<ActorsBloc>().showDialogNewActor(context),
                            title: 'New Actor / Actress',
                          ),
                          verticalSpaceMedium
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
