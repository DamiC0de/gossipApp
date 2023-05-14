class CommentsController < ApplicationController
    def create
      @gossip = Gossip.find(params[:gossip_id])
      @comment = @gossip.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        flash[:notice] = "Comment successfully added"
        redirect_to @gossip
      else
        flash.now[:alert] = "Failed to add comment"
        render 'gossips/show'
      end
    end

    def edit
        @gossip = Gossip.find(params[:gossip_id])
        @comment = @gossip.comments.find(params[:id])
      end
    
    def update
        @gossip = Gossip.find(params[:gossip_id])
        @comment = @gossip.comments.find(params[:id])
        if @comment.update(comment_params)
          redirect_to gossip_path(@gossip), notice: 'Comment was successfully updated.'
        else
          render :edit
        end
      end
      
    def destroy
          @gossip = Gossip.find(params[:gossip_id])
          @comment = @gossip.comments.find(params[:id])
          if current_user == @comment.user || current_user == @gossip.user
            @comment.destroy
            flash[:notice] = "Comment successfully deleted"
            redirect_to gossip_path(@gossip)
          else
            flash[:alert] = "You do not have permission to delete this comment"
            redirect_to gossip_path(@gossip)
          end
        end
    end
      
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end

  