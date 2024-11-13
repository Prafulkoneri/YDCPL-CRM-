class ScriptResponseModel {
  String? status;
  String? message;
  ScriptData? scriptData;

  ScriptResponseModel({
    this.status,
    this.message,
    this.scriptData,
  });
  ScriptResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    scriptData =
        json['data'] != null ? ScriptData.fromJson(json['data']) : null;
  }
}

class ScriptData {
  List<Script>? script;
  List<ScriptCategorys>? scriptCategories;

  ScriptData({
    this.script,
    this.scriptCategories,
  });
  ScriptData.fromJson(Map<String, dynamic> json) {
    if (json["script"] != null) {
      script = <Script>[];
      json["script"].forEach((v) {
        script!.add(Script.fromJson(v));
      });
    }
    if (json["script_categories"] != null) {
      scriptCategories = <ScriptCategorys>[];
      json["script_categories"].forEach((v) {
        scriptCategories!.add(ScriptCategorys.fromJson(v));
      });
    }
  }
}

class Script {
  int? id;
  String? scriptContentEnglish;
  String? scriptContentHindi;
  String? scriptContentMarathi;

  Script({
    this.id,
    this.scriptContentEnglish,
    this.scriptContentHindi,
    this.scriptContentMarathi,
  });
  Script.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scriptContentEnglish = json['script_content_english'];
    scriptContentHindi = json['script_content_hindi'];
    scriptContentMarathi = json['script_content_marathi'];
  }
}

class ScriptCategorys {
  int? id;
  String? typeName;
  String? scriptFor;

  ScriptCategorys({
    this.id,
    this.typeName,
    this.scriptFor,
  });
  ScriptCategorys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    scriptFor = json['script_for'];
  }
}

//////////////////////////////////////////////////////////
class ScriptRequestModel {
  String? scriptCategoryId;
  ScriptRequestModel({
    this.scriptCategoryId,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["script_category_id"] = scriptCategoryId;
    return data;
  }
}
