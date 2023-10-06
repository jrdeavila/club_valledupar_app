import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationScreen extends GetView<ReservationController> {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Tus Reservaciones'),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                controller.onCreateNew();
              },
              child: const Icon(
                Icons.edit_calendar,
                size: 30,
              )),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: ReservationDetailsCard(
                        title: "Pendientes",
                        count: controller.pendingReservations.length,
                        icon: Icons.pending,
                        color: Theme.of(context).colorScheme.onSecondary,
                        bgColor: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ReservationDetailsCard(
                        title: "Realizadas",
                        count: controller.doneReservations.length,
                        icon: Icons.check_box,
                        color: Theme.of(context).colorScheme.onSecondary,
                        bgColor: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 20),
                _buildCalendar(context),
                const SizedBox(height: 10),
                Text(
                  "Reservaciones para el ${controller.focusedDay.day}/${controller.focusedDay.month}/${controller.focusedDay.year}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ...controller.reservationsByDay.map((reservation) {
                      return ReservationCard(
                        title: reservation.typeReservation.name,
                        desc: "Reservado para ${reservation.insumeArea.name}",
                        isDone: controller.isDone(reservation.endDate),
                        createdAt:
                            "Reservado ${controller.timeAgo(reservation.createdAt!)}",
                        color: controller.color(reservation.insumeArea.color),
                        startTime: controller.hour(reservation.startDate),
                        endTime: controller.hour(reservation.endDate),
                        onDelete: () {
                          controller.onDeleteReservation(reservation);
                        },
                      );
                    }).toList(),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Container _buildCalendar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]),
      child: TableCalendar<Reservation>(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: controller.focusedDay,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          markerDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          controller.changeFocusedDay(selectedDay);
        },
        eventLoader: (day) {
          return controller.getByDay(day);
        },
        calendarFormat: controller.calendarFormat,
        currentDay: controller.focusedDay,
        onFormatChanged: (format) {
          controller.changeCalendarFormat(format);
        },
        locale: "es_CO",
      ),
    );
  }
}

class ReservationDetailsCard extends StatelessWidget {
  const ReservationDetailsCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.bgColor,
  });

  final String title;
  final int count;
  final IconData icon;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: 120,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "($count)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final String title;
  final String desc;
  final String startTime;
  final String endTime;
  final bool isDone;
  final String createdAt;
  final int color;
  final void Function() onDelete;

  const ReservationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.createdAt,
    required this.color,
    required this.onDelete,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.grey[600];
    final color = Color(this.color);
    return GestureDetector(
      onLongPress: onDelete,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          desc,
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "$startTime - $endTime",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    createdAt,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(
                    isDone ? Icons.check : Icons.access_time,
                    color: textColor,
                    size: 40.0,
                  ),
                  Text(
                    isDone ? "Realizada" : "Pendiente",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
