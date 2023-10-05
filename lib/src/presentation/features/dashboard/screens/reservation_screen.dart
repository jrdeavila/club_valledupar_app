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
              onTap: () {},
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
                        createdAt: controller.timeAgo(reservation.createdAt),
                        color: controller.color(reservation.insumeArea.color),
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

class ReservationCard extends StatelessWidget {
  final String title;
  final String desc;
  final bool isDone;
  final String createdAt;
  final int color;
  const ReservationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.createdAt,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.grey[600];
    final color = Color(this.color);
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                  Text(
                    desc,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
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
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(
                  isDone ? Icons.check : Icons.pending_sharp,
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
    );
  }
}
