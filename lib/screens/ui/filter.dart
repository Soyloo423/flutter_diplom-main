import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String _selectedFilter = 'All'; // Default selected filter
  DateTime _selectedCheckInDate =
      DateTime.now(); // Default selected check-in date
  bool _filterByCheckIn = false; // Whether to filter by check-in date or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedFilter,
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'All',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'Luxury',
                  child: Text('Luxury'),
                ),
                DropdownMenuItem(
                  value: 'Budget',
                  child: Text('Budget'),
                ),
                // Add more filter options as needed
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _filterByCheckIn,
                  onChanged: (value) {
                    setState(() {
                      _filterByCheckIn = value!;
                    });
                  },
                ),
                Text(
                  'Filter by Check-in Date',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            if (_filterByCheckIn)
              Row(
                children: [
                  Text(
                    'Check-in Date:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedCheckInDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null &&
                          pickedDate != _selectedCheckInDate) {
                        setState(() {
                          _selectedCheckInDate = pickedDate;
                        });
                      }
                    },
                    child: Text(
                      '${_selectedCheckInDate.day}/${_selectedCheckInDate.month}/${_selectedCheckInDate.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement filtering logic based on the selected filter and check-in date
                // You can pass the selected filter value, check-in date, and filter by check-in flag back to the previous screen
                Map<String, dynamic> filters = {
                  'filter': _selectedFilter,
                  'checkInDate': _selectedCheckInDate,
                  'filterByCheckIn': _filterByCheckIn,
                };
                Navigator.pop(context, filters);
              },
              child: Text('Apply Filter'),
            ),
          ],
        ),
      ),
    );
  }
}
