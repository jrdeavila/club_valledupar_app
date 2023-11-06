import 'package:club_valledupar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationScreen extends GetView<ReservationController> {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/reservaciones.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const BlurredContainer(),
          SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 160.0,
                    child: AppBar(
                      leading: BackButton(
                        color: Get.find<ColorPalete>().textOnPrimary,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                "Tus Reservaciones",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Get.find<ColorPalete>().textOnPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: ReservationDetailsCard(
                          title: "Pendientes",
                          count: controller.pendingReservations.length,
                          icon: Icons.pending,
                          color: Get.find<ColorPalete>().textOnSecondary,
                          bgColor: Get.find<ColorPalete>().componentColor,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ReservationDetailsCard(
                            title: "Realizadas",
                            count: controller.doneReservations.length,
                            icon: Icons.check_box,
                            color: Get.find<ColorPalete>().textOnSecondary,
                            bgColor: Get.find<ColorPalete>().componentColor),
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
                          title:
                              "Reservado para ${reservation.insumeArea.name}",
                          desc: () {
                            if (reservation.isEver) {
                              return "Reservado para siempre";
                            }
                            if (reservation.isAllDay) {
                              return "Reservacion para todo el dia";
                            } else {
                              return "Reservacion normal";
                            }
                          }(),
                          isDone: controller.isDone(reservation.endDate),
                          createdAt:
                              "Reservado ${controller.timeAgo(reservation.createdAt!)}",
                          startTime: controller.hour(reservation.startDate),
                          endTime: controller.hour(reservation.endDate),
                          isEver: reservation.isEver,
                          onDelete: () {
                            controller.onDeleteReservation(reservation);
                          },
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onCreateNew();
        },
        backgroundColor: Get.find<ColorPalete>().componentColor,
        child: const Icon(Icons.calendar_today),
      ),
    );
  }

  Container _buildCalendar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Get.find<ColorPalete>().componentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TableCalendar<Reservation>(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: controller.focusedDay,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Get.find<ColorPalete>().textOnSecondary,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Get.find<ColorPalete>().textOnSecondary,
          ),
          titleTextStyle: TextStyle(
            color: Get.find<ColorPalete>().textOnSecondary,
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
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Get.find<ColorPalete>().textOnSecondary,
            fontWeight: FontWeight.bold,
          ),
          weekendStyle: TextStyle(
            color: Get.find<ColorPalete>().textOnSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        onFormatChanged: (format) {
          controller.changeCalendarFormat(format);
        },
        locale: "es_CO",
      ),
    );
  }
}
