import 'package:flutter/material.dart';
import 'package:hairsaloon/models/doctors.dart';
import 'package:hairsaloon/widgets/reusable_raw_btn.dart';

import 'constants.dart';
import 'home_screen.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  NavGoBack(
                    title: 'Appointments',
                  ),
                  DoctorWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  DoctorAbout(),
                  SizedBox(
                    height: 20.0,
                  ),
                  ReusableHeaderText()
                ]),
          ),
        ),
      ),
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(children: const [
        AboutTile(),
        SizedBox(
          height: 20.0,
        ),
        DoctorPatientCard(),
        SizedBox(
          height: 30.0,
        ),
        TimeBookingBtn(),
        SizedBox(
          height: 20.0,
        ),
      ]),
    );
  }
}

class ReusableHeaderText extends StatelessWidget {
  const ReusableHeaderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Upcoming schedule',
            style: TextStyle(fontSize: 20.0, letterSpacing: 1.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.0,
          ),
          UpcomingTile()
        ],
      ),
    );
  }
}

class DoctorPatientCard extends StatelessWidget {
  const DoctorPatientCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorCard(
          title: 'Patients',
          number: '${doctor.doctorPatients}',
        ),
        DoctorCard(
          title: 'Experience',
          number: '${doctor.doctorExperience}',
        ),
      ],
    );
  }
}

class AboutTile extends StatelessWidget {
  const AboutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(doctor.doctorName, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),),
        subtitle: Text(doctor.doctorType, style: TextStyle(fontSize: 16.0),),
        trailing: Hero(
            tag: 'doctorHero',
            child: CircleAvatar(backgroundImage: NetworkImage(doctor.doctorImage), radius: 25.0,)),
      ),
    );
  }
}

class UpcomingTile extends StatelessWidget {
  const UpcomingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      child: Row(children: [
        Container(
          width: 80,
          height: 100.0,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wed'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  '11',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ]),
        ),
        const SizedBox(
          width: 15.0,
        ),
        const UpcomingTextTile(),
        const Spacer(),
        const ReusableRawBtn(),
      ]),
    );
  }
}

class UpcomingTextTile extends StatelessWidget {
  const UpcomingTextTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Heart Surgeon',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '09:00 AM',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class DoctorAbout extends StatelessWidget {
  const DoctorAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.20,
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
            'About Doctor',
            style: TextStyle(fontSize: 20.0, letterSpacing: 1.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            doctor.doctorAbout,
            style: const TextStyle(fontSize: 16.0, letterSpacing: 1.0, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class NavGoBack extends StatelessWidget {
  final String title;
  const NavGoBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 22.0),
      )
    ]);
  }
}

class DoctorCard extends StatelessWidget {
  final String title;
  final String number;
  const DoctorCard({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 5.0,
      decoration: kBoxDecoWithBoxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${number}+',
            style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.pink),
          )
        ],
      ),
    );
  }
}
