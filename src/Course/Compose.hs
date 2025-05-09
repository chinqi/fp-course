{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Course.Compose where

import Course.Applicative
import Course.Contravariant
import Course.Core
import Course.Functor
import Course.Monad

-- Exactly one of these exercises will not be possible to achieve. Determine which.

newtype Compose f g a
  = Compose (f (g a))
  deriving (Show, Eq)

-- Implement a Functor instance for Compose
instance
  (Functor f, Functor g) =>
  Functor (Compose f g)
  where
  (<$>) fa (Compose fg) = Compose ((fa <$>) <$> fg)

instance
  (Applicative f, Applicative g) =>
  Applicative (Compose f g)
  where
  -- Implement the pure function for an Applicative instance for Compose
  pure = Compose . pure . pure

  -- Implement the (<*>) function for an Applicative instance for Compose
  (<*>) (Compose ff) (Compose ga) = Compose (lift2 (<*>) ff ga)

instance
  (Monad f, Monad g) =>
  Monad (Compose f g)
  where
  -- Implement the (=<<) function for a Monad instance for Compose
  (=<<) =
    error "todo: Course.Compose (=<<)#instance (Compose f g)"

-- Note that the inner g is Contravariant but the outer f is
-- Functor. We would not be able to write an instance if both were
-- Contravariant; why not?
instance
  (Functor f, Contravariant g) =>
  Contravariant (Compose f g)
  where
  -- Implement the (>$<) function for a Contravariant instance for Compose
  (>$<) = error "todo: Course.Compose (>$<)#instance (Compose f g)"