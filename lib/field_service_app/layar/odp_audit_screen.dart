import 'package:flutter/material.dart';
import 'package:field_technician_app/field_service_app/data/odp_audit_model.dart';
import 'package:field_technician_app/field_service_app/workflow/odp_audit_workflow.dart';

class OdpAuditScreen extends StatefulWidget {
  const OdpAuditScreen({Key? key}) : super(key: key);

  @override
  _OdpAuditScreenState createState() => _OdpAuditScreenState();
}

class _OdpAuditScreenState extends State<OdpAuditScreen> {
  final OdpAuditWorkflow _workflow = OdpAuditWorkflow();

  @override
  void initState() {
    super.initState();
    _workflow.loadAudit('ODP-JKT-042');
  }

  // Helper method to get color based on status
  Color _getStatusColor(PortStatus status, bool isDarkMode) {
    switch (status) {
      case PortStatus.ghost:
        return Colors.red.withOpacity(0.1);
      case PortStatus.mismatch:
        return Colors.amber.withOpacity(0.1);
      default:
        return isDarkMode ? const Color(0xFF1c2630) : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    final surfaceColor = isDarkMode ? const Color(0xFF1c2630) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final OdpAudit? audit = _workflow.audit;

    if (audit == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ODP Audit',
                style:
                    TextStyle(color: textColor, fontWeight: FontWeight.bold)),
            Text(audit.region,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _workflow.submitAudit,
            child: const Text('Submit',
                style: TextStyle(
                    color: Color(0xFF137fec), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOdpInfoCard(audit, surfaceColor, textColor),
          const SizedBox(height: 24),
          _buildEvidenceSection(surfaceColor, textColor),
          const SizedBox(height: 24),
          _buildPortValidationList(audit, surfaceColor, textColor, isDarkMode),
        ],
      ),
    );
  }

  Widget _buildOdpInfoCard(
      OdpAudit audit, Color surfaceColor, Color textColor) {
    return Card(
      color: surfaceColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ODP ID',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(audit.id,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Utilization',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text('${audit.utilizedPorts}/${audit.totalPorts}',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: audit.utilization,
              backgroundColor: Colors.grey.withOpacity(0.3),
              color: const Color(0xFF137fec),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvidenceSection(Color surfaceColor, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Visual Evidence',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuAKWTyUi53ySjzSrnQN0o4A6JjZgruYOW70VusZFgoNb012N0S6BAc2YJjKZvwpj2l0JXKde86WUDfPvMgc84Mz7B0_hS4UBN4t-qQ1AAFiGlKyQo0PyoazHVThhTVMuJVGBJ6OQzCeTcTRMDMJpD4oC8lN2X2bLlg_BuyfC-AZWlbpBMVebqls-HGLCjWsFI5hliVOforzGuPRYqrqZbWkX2ic849PsNxSnhmY9IPCKu1qxNsaWw5AdVBybvjSwki1ahM3E4ZZoSI"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Before',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo, color: Colors.grey, size: 40),
                      SizedBox(height: 8),
                      Text('After Maint.',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPortValidationList(
      OdpAudit audit, Color surfaceColor, Color textColor, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Port Validation',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        ...audit.portValidations
            .map((port) => _buildPortValidationRow(
                port, surfaceColor, textColor, isDarkMode))
            .toList(),
      ],
    );
  }

  Widget _buildPortValidationRow(PortValidation port, Color surfaceColor,
      Color textColor, bool isDarkMode) {
    return Card(
      color: _getStatusColor(port.status, isDarkMode),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: port.status != PortStatus.match
            ? BorderSide(color: Colors.red.withOpacity(0.3))
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Port ${port.portNumber.toString().padLeft(2, '0')}',
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(port.customerName,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                if (port.status == PortStatus.match)
                  const Icon(Icons.check_circle, color: Colors.green),
                if (port.status == PortStatus.ghost)
                  const Icon(Icons.error, color: Colors.red),
                if (port.status == PortStatus.mismatch)
                  const Icon(Icons.warning, color: Colors.amber),
              ],
            ),
            if (port.status == PortStatus.mismatch)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter actual tag ID found...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusButton('Match', PortStatus.match, port),
                _buildStatusButton('Ghost', PortStatus.ghost, port),
                _buildStatusButton('Mismatch', PortStatus.mismatch, port),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(
      String title, PortStatus buttonStatus, PortValidation port) {
    bool isSelected = buttonStatus == port.status;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _workflow.updatePortStatus(port.portNumber, buttonStatus);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFF137fec) : Colors.grey.withOpacity(0.2),
        foregroundColor: isSelected ? Colors.white : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(title),
    );
  }
}
