import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class BookEndpoint extends Endpoint {
  Future<List<Book>> getAllBook(Session session) async {
    return await Book.find(session);
  }

  Future<bool> save(Session session, Book book) async {
    try {
      await Book.insert(session, book);
      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
