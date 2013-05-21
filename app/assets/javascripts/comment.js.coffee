class Comment
  constructor: ->

  buildReplyComment: (comment_form, comment_id) ->
    comment_form.attr("id", "reply-comment-" + comment_id)
    comment_form.find("#comment_commentable_type").attr("value", "Comment")
    comment_form.find("#comment_commentable_id").attr("value", comment_id)
    return comment_form

  commentReply: ->
    self = this
    $(".comment .reply").on "click", (event) ->
      comment_form = self.buildReplyComment($("#new_comment").clone(), $(this).attr("href"))
      $(this).closest(".comment").append(comment_form)
      return false

window.Comment = Comment
