function [ work_vector, maxline, minline ] = boundary( work_vect, maxline, minline )
%boundary cut the vector if values are to high at the beginning or the end
%because of the interpolation.
 m = median(work_vect);

if work_vect(1) > 2*m || work_vect(1) < 2*m





end

