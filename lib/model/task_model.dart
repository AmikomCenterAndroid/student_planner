part of 'models.dart';

class TaskModel extends Equatable {
  final String taskId;
  final String judul;
  final String keterangan;
  final String gambar;

  TaskModel(this.taskId, this.judul, this.keterangan, this.gambar);

  @override
  List<Object> get props => [taskId, judul, keterangan, gambar];
}
