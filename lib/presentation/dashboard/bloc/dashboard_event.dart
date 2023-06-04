abstract class DashboardEvent {}

class ChangeMenu extends DashboardEvent {
  int pos;

  ChangeMenu(this.pos);
}