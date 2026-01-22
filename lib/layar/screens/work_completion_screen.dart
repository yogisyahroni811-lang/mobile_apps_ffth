import 'package:flutter/material.dart';

class WorkCompletionScreen extends StatelessWidget {
  const WorkCompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define colors based on the second screen's design
    final bool isDarkMode = true; // Assuming dark mode as per design
    final Color backgroundColor =
        isDarkMode ? Color(0xFF23230F) : Color(0xFFF8F8F5);
    final Color surfaceColor = isDarkMode ? Color(0xFF2D2D14) : Colors.white;
    final Color primaryColor =
        isDarkMode ? Color(0xFFF9F906) : Color(0xFFF9F906);
    final Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Work Summary',
            style: TextStyle(
                color: textColor, fontSize: 18.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            color: primaryColor.withOpacity(0.1),
            height: 40.0,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sync, color: primaryColor, size: 18),
                const SizedBox(width: 8),
                Text('Syncing to Dashboard...',
                    style: TextStyle(color: textColor, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStatusCard(surfaceColor, primaryColor),
            const SizedBox(height: 24),
            _buildActivitySummary(surfaceColor),
            const SizedBox(height: 24),
            _buildPhotosSection(),
            const SizedBox(height: 24),
            _buildNotesSection(surfaceColor),
          ],
        ),
      ),
      bottomNavigationBar: _buildSubmitButton(backgroundColor, primaryColor),
    );
  }

  Widget _buildStatusCard(Color surfaceColor, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.1),
            radius: 24,
            child: Icon(Icons.check_circle, color: primaryColor, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Task Completed',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text('04:15 PM • Oct 24, 2023',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActivitySummary(Color surfaceColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('  Activity Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _buildActivityItem(surfaceColor, 'Fiber Splicing',
            'Main distribution point', Icons.timeline, '144 Cores'),
        const SizedBox(height: 12),
        _buildActivityItem(surfaceColor, 'Equipment Swap', 'Serial #X892-BB',
            Icons.router, 'ONT Device'),
        const SizedBox(height: 12),
        _buildActivityItem(surfaceColor, 'Cabling Used',
            'Drop cable replacement', Icons.cable, '150m'),
      ],
    );
  }

  Widget _buildActivityItem(Color surfaceColor, String title, String subtitle,
      IconData icon, String trailing) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF4a4a21),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ],
            ),
          ),
          Text(trailing, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPhotosSection() {
    // Dummy image URLs
    final imageUrls = [
      "https://lh3.googleusercontent.com/aida-public/AB6AXuAJF0Mk06mEhVOJ7bJEPdifYkxjOn_KlV_Tf_Q3afCZzXoivAplt09zE-Jz415j2tAn34faJ0Uao-noik-yzIPcdgrvHeGqjY-R-HOqWvGeOhbU9lO064Itw5tMRFL34iku2V1d5esElH9M4vVezyubMaL20ufiELLyKALnD_CSShI9UebB1dFAHESNv4Ec__xoQN8meGnO00BX9lmUctmsshxcYVNMySvvCvw3s_EOhhDEtClodrAVY_ev6Ubg88Y3YqjjxHjyrl4",
      "https://lh3.googleusercontent.com/aida-public/AB6AXuC72RC2gwzE2R6B6q6GbC0mKNcIOXeb05MURVRR2aa0TUnPYK0YzWd-ARjcZlm2OxFlvn1n---jAszfbtyaHlujUnhx93Znh1yxmreNgQzYY2OBNM3Y-JI2lSJvTZWck-D7KMVI9jXayRUNCyYs95U8zCiqmhoLqB0U5phOi2o8vq9poras9e4jUMKGHyGzmzAT4CeKDM4tcn74cDNA-eLzp23ulVI0wm8OqSxDD0_9KkcAuJrN2UWKpZ5IiMDbAjseaSjKEGEaq0o",
      "https://lh3.googleusercontent.com/aida-public/AB6AXuBJSncM3QTn9R0VlhlUBHWc7jptWU3hiLsIvmBdAo9THPA26k33C_34s__ZZNa2iF-U9mBOeh03LX79biwj8s10wIUB0mf9sQjHAeSZErHDOJjowJG0OlGXkflejyRrk0hpmCvqDNDkI-18MBNF-v4XwIDE_ss2GOK66Y13vzuAcZNIcQbjLBrzHaQIfFhZgYOP4T-PBoLrupzOnm0Dzk0PFymGE6Elkesrcz1exAo0Euh1hftoZ1ZYUrXUm6aS1Q00-YrgGWpa8Qs",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('  Evidence Photos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text('Edit',
                  style: TextStyle(color: Color(0xFFF9F906))),
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length + 1,
            itemBuilder: (context, index) {
              if (index == imageUrls.length) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey[600]!, style: BorderStyle.solid),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo, color: Colors.grey),
                      SizedBox(height: 4),
                      Text('Add New',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                );
              }
              return Container(
                width: 100,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imageUrls[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotesSection(Color surfaceColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('  Notes / Findings',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            fillColor: surfaceColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            hintText:
                'Add details about the signal strength, customer interactions, or anomalies found...',
          ),
        )
      ],
    );
  }

  Widget _buildSubmitButton(Color backgroundColor, Color primaryColor) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.send, color: Colors.black),
        label: const Text('Submit Report',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
