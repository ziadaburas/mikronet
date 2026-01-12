// Mock Data for Net Manager Application

class MockData {
  // Login credentials
  static const String defaultHost = '192.168.1.1';
  static const String defaultPort = '8080';
  static const String defaultUsername = 'admin';
  static const String defaultPassword = 'admin123';
  static const String defaultNetworkName = 'MyNetwork';

  // Saved credentials history
  static List<Map<String, String>> savedCredentials = [
    {'host': '192.168.1.1', 'port': '8080', 'username': 'admin', 'network': 'MyNetwork'},
    {'host': '192.168.0.1', 'port': '8080', 'username': 'user1', 'network': 'Office'},
    {'host': '10.0.0.1', 'port': '3000', 'username': 'admin', 'network': 'Home'},
  ];

  // Cards data
  static List<Map<String, dynamic>> cards = [
    {
      'id': '1',
      'number': '28674635353',
      'package': '200',
      'timeUsed': '50 دقيقة',
      'timeRemaining': '120 دقيقة',
      'validityUsed': '15 يوم',
      'validityRemaining': '15 يوم',
      'downloadUsed': '2 جيجابايت',
      'downloadRemaining': '5 جيجابايت',
      'uploadUsed': '500 ميجابايت',
      'uploadRemaining': '1 جيجابايت',
      'isActive': true,
    },
    {
      'id': '2',
      'number': '1234567890123456',
      'package': '200',
      'timeUsed': '30 دقيقة',
      'timeRemaining': '90 دقيقة',
      'validityUsed': '10 يوم',
      'validityRemaining': '20 يوم',
      'downloadUsed': '1 جيجابايت',
      'downloadRemaining': '4 جيجابايت',
      'uploadUsed': '200 ميجابايت',
      'uploadRemaining': '800 ميجابايت',
      'isActive': true,
    },
    {
      'id': '3',
      'number': '9876543210987654',
      'package': '100',
      'timeUsed': '60 دقيقة',
      'timeRemaining': '60 دقيقة',
      'validityUsed': '20 يوم',
      'validityRemaining': '10 يوم',
      'downloadUsed': '3 جيجابايت',
      'downloadRemaining': '2 جيجابايت',
      'uploadUsed': '700 ميجابايت',
      'uploadRemaining': '300 ميجابايت',
      'isActive': false,
    },
  ];

  // Packages data
  static List<Map<String, dynamic>> packages = [
    {
      'id': '1',
      'name': 'باقة يومية',
      'price': 100,
      'timeMinutes': 120,
      'validityDays': 1,
      'downloadGB': 2,
      'speedMbps': 50,
      'isUnlimitedTime': false,
      'isUnlimitedValidity': false,
      'isUnlimitedDownload': false,
      'isUnlimitedSpeed': false,
    },
    {
      'id': '2',
      'name': 'باقة أسبوعية',
      'price': 200,
      'timeMinutes': 1800,
      'validityDays': 7,
      'downloadGB': 10,
      'speedMbps': 100,
      'isUnlimitedTime': false,
      'isUnlimitedValidity': false,
      'isUnlimitedDownload': false,
      'isUnlimitedSpeed': true,
    },
    {
      'id': '3',
      'name': 'باقة شهرية',
      'price': 500,
      'timeMinutes': 0,
      'validityDays': 30,
      'downloadGB': 100,
      'speedMbps': 0,
      'isUnlimitedTime': true,
      'isUnlimitedValidity': false,
      'isUnlimitedDownload': false,
      'isUnlimitedSpeed': true,
    },
  ];

  // Active packages (for display)
  static List<int> activePackages = [100, 200];
  static List<int> expiredPackages = [200, 500];

  // Users data
  static List<Map<String, dynamic>> users = [
    {
      'id': '1',
      'ip': '192.168.88.14',
      'mac': 'E4:8D:8C:11:22:33',
      'status': 'active',
      'connectionDuration': '02:15:40',
      'download': '500 MB',
      'upload': '120 MB',
      'comment': '',
    },
    {
      'id': '2',
      'ip': '192.168.88.21',
      'mac': 'F8:A9:D1:44:55:66',
      'status': 'active',
      'connectionDuration': '05:30:15',
      'download': '1.2 GB',
      'upload': '450 MB',
      'comment': '',
    },
    {
      'id': '3',
      'ip': '192.168.88.50',
      'mac': 'A1:B2:C3:D4:E5:F6',
      'status': 'inactive',
      'connectionDuration': '00:45:00',
      'download': '200 MB',
      'upload': '80 MB',
      'comment': '',
    },
    {
      'id': '4',
      'ip': '192.168.88.20',
      'mac': 'A1:B2:C3:D4:E5:F6',
      'status': 'active',
      'connectionDuration': '05:30:12',
      'download': '1.2 GB',
      'upload': '300 MB',
      'comment': 'موظف جديد',
    },
  ];

  // User statistics
  static Map<String, int> userStats = {
    'total': 100,
    'active': 45,
    'inactive': 30,
    'banned': 5,
    'free': 20,
  };

  // Sessions data
  static List<Map<String, dynamic>> sessions = [
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-25 09:30:00',
      'endTime': '2023-10-25 10:45:15',
      'download': '1.2 جيجابايت',
      'upload': '50 ميجابايت',
      'used': '1.25 جيجابايت',
      'ip': '192.168.1.105',
      'mac': '00:1A:2B:3C:4D:5E',
      'duration': '1 ساعة و 15 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-24 18:00:00',
      'endTime': '2023-10-24 21:15:30',
      'download': '3.5 جيجابايت',
      'upload': '100 ميجابايت',
      'used': '3.6 جيجابايت',
      'ip': '192.168.1.106',
      'mac': '00:1A:2B:3C:4D:5F',
      'duration': '3 ساعات و 15 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-24 11:15:00',
      'endTime': '2023-10-24 12:30:45',
      'download': '500 ميجابايت',
      'upload': '30 ميجابايت',
      'used': '530 ميجابايت',
      'ip': '192.168.1.107',
      'mac': '00:1A:2B:3C:4D:60',
      'duration': '1 ساعة و 15 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-23 22:00:00',
      'endTime': '2023-10-24 01:20:10',
      'download': '4.1 جيجابايت',
      'upload': '200 ميجابايت',
      'used': '4.3 جيجابايت',
      'ip': '192.168.1.108',
      'mac': '00:1A:2B:3C:4D:61',
      'duration': '3 ساعات و 20 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-23 08:00:00',
      'endTime': '2023-10-23 09:15:20',
      'download': '800 ميجابايت',
      'upload': '50 ميجابايت',
      'used': '850 ميجابايت',
      'ip': '192.168.1.109',
      'mac': '00:1A:2B:3C:4D:62',
      'duration': '1 ساعة و 15 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-23 06:30:00',
      'endTime': '2023-10-23 10:45:15',
      'download': '100 ميجابايت',
      'upload': '20 ميجابايت',
      'used': '120 ميجابايت',
      'ip': '192.168.1.110',
      'mac': '00:1A:2B:3C:4D:63',
      'duration': '4 ساعات و 15 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-23 09:00:00',
      'endTime': '2023-10-23 03:20:10',
      'download': '200 ميجابايت',
      'upload': '40 ميجابايت',
      'used': '240 ميجابايت',
      'ip': '192.168.1.111',
      'mac': '00:1A:2B:3C:4D:64',
      'duration': '6 ساعات و 20 دقيقة',
    },
    {
      'cardNumber': '28674635353',
      'startTime': '2023-10-23 09:00:00',
      'endTime': '2023-10-23 10:15:10',
      'download': '500 ميجابايت',
      'upload': '80 ميجابايت',
      'used': '580 ميجابايت',
      'ip': '192.168.1.112',
      'mac': '00:1A:2B:3C:4D:65',
      'duration': '1 ساعة و 15 دقيقة',
    },
  ];

  // DNS data
  static List<Map<String, dynamic>> dnsServers = [
    {'id': '1', 'address': '8.8.8.8'},
    {'id': '2', 'address': '1.1.1.1'},
    {'id': '3', 'address': '208.67.222.222'},
  ];

  // DNS Cache data
  static List<Map<String, dynamic>> dnsCache = [
    {'host': 'google.com', 'type': 'A', 'data': '142.250.185.78', 'ttl': '300s'},
    {'host': 'example.net', 'type': 'CNAME', 'data': 'cdn.example.net', 'ttl': '60s'},
    {'host': 'local-router', 'type': 'A', 'data': '192.168.88.1', 'ttl': '3600s'},
    {'host': 'dns.google', 'type': 'A', 'data': '8.8.8.8', 'ttl': '120s'},
  ];

  // Print templates
  static List<Map<String, dynamic>> printTemplates = [
    {
      'id': '1',
      'name': 'القالب الافتراضي',
      'usernameLength': 15,
      'passwordLength': 12,
      'includePassword': true,
    },
  ];

  // Sales reports data
  static List<Map<String, dynamic>> salesReports = [
    {'date': '2023-10-25', 'package': 'باقة يومية', 'count': 50, 'total': 5000},
    {'date': '2023-10-25', 'package': 'باقة أسبوعية', 'count': 30, 'total': 6000},
    {'date': '2023-10-24', 'package': 'باقة شهرية', 'count': 10, 'total': 5000},
    {'date': '2023-10-24', 'package': 'باقة يومية', 'count': 45, 'total': 4500},
  ];

  // Internet usage reports
  static List<Map<String, dynamic>> usageReports = [
    {'date': '2023-10-25', 'download': '150 GB', 'upload': '30 GB', 'users': 45},
    {'date': '2023-10-24', 'download': '180 GB', 'upload': '35 GB', 'users': 52},
    {'date': '2023-10-23', 'download': '120 GB', 'upload': '25 GB', 'users': 38},
  ];
}
