require 'thor'
# Ask variables and render templates
module DockerizeStack
  # Ask variables and render templates
  class React < Thor
    include Thor::Actions
    include ThorActionsExtend

    attr_accessor :nodejs_version, :output_folder

    no_commands do

      def render_templates
        render_template 'Dockerfile.erb'
        render_template 'dockerignore.erb', '.dockerignore'

        directory 'nginx', "#{@output_folder}/nginx"
      end
    end
  end
end
