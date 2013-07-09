module StaticPagesHelper
	def categorize(project)
		a = project.tag_list.map! {|tag| tag.parameterize(sep = '-')}
		a.join(" ")
	end
end
