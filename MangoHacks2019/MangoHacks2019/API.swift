//  This file was automatically generated and should not be edited.

import Apollo

public final class GetPostsQuery: GraphQLQuery {
  public let operationDefinition =
    "query getPosts {\n  postsList {\n    __typename\n    items {\n      __typename\n      postID\n      postTitle\n      postBody\n      postCategory\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("postsList", type: .nonNull(.object(PostsList.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(postsList: PostsList) {
      self.init(unsafeResultMap: ["__typename": "Query", "postsList": postsList.resultMap])
    }

    public var postsList: PostsList {
      get {
        return PostsList(unsafeResultMap: resultMap["postsList"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "postsList")
      }
    }

    public struct PostsList: GraphQLSelectionSet {
      public static let possibleTypes = ["PostListResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item]) {
        self.init(unsafeResultMap: ["__typename": "PostListResponse", "items": items.map { (value: Item) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// List items
      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("postID", type: .scalar(Int.self)),
          GraphQLField("postTitle", type: .scalar(String.self)),
          GraphQLField("postBody", type: .scalar(String.self)),
          GraphQLField("postCategory", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(postId: Int? = nil, postTitle: String? = nil, postBody: String? = nil, postCategory: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Post", "postID": postId, "postTitle": postTitle, "postBody": postBody, "postCategory": postCategory])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var postId: Int? {
          get {
            return resultMap["postID"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "postID")
          }
        }

        public var postTitle: String? {
          get {
            return resultMap["postTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postTitle")
          }
        }

        public var postBody: String? {
          get {
            return resultMap["postBody"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postBody")
          }
        }

        public var postCategory: String? {
          get {
            return resultMap["postCategory"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postCategory")
          }
        }
      }
    }
  }
}