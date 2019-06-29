class ConstantSql {
  ///查询是否存在某张表
  static String queryTab(String tabName) =>
      "select * from Sqlite_master where type = 'table' and name = '$tabName'";

  ///查询数据库中的所有表
  static String queryAllTab() => "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name";

  ///创建表
  static String createTab(String tabName, String column) =>
      "CREATE TABLE $tabName ($column";

  ///删除表
  static String deleteTab(String tabName) => "DROP TABLE $tabName";






}
